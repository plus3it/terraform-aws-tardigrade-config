module "config" {
  source = "../../"

  config = {
    configuration_recorder = {
      name = "tardigrade-config-${random_string.this.result}"

      recording_mode = {
        recording_frequency = "CONTINUOUS"

        recording_mode_override = {
          description = "Only record EC2 network interfaces and internet gateways daily"
          resource_types = [
            "AWS::EC2::NetworkInterface",
            "AWS::EC2::InternetGateway"
          ]
          recording_frequency = "DAILY"
        }
      }
    }

    delivery_channel = {
      s3_bucket_name = aws_s3_bucket_policy.this.id
    }
  }
}

resource "aws_s3_bucket" "this" {
  bucket        = "tardigrade-config-${random_string.this.result}"
  force_destroy = true
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AWSConfigBucketPermissionsCheck",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "config.amazonaws.com"
        },
        "Action" : "s3:GetBucketAcl",
        "Resource" : aws_s3_bucket.this.arn,
        "Condition" : {
          "StringEquals" : {
            "AWS:SourceAccount" : data.aws_caller_identity.current.account_id
          }
        }
      },
      {
        "Sid" : "AWSConfigBucketExistenceCheck",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "config.amazonaws.com"
        },
        "Action" : "s3:ListBucket",
        "Resource" : aws_s3_bucket.this.arn,
        "Condition" : {
          "StringEquals" : {
            "AWS:SourceAccount" : data.aws_caller_identity.current.account_id
          }
        }
      },
      {
        "Sid" : "AWSConfigBucketDelivery",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "config.amazonaws.com"
        },
        "Action" : "s3:PutObject",
        "Resource" : "${aws_s3_bucket.this.arn}/AWSLogs/${data.aws_caller_identity.current.account_id}/Config/*",
        "Condition" : {
          "StringEquals" : {
            "s3:x-amz-acl" : "bucket-owner-full-control",
            "AWS:SourceAccount" : data.aws_caller_identity.current.account_id
          }
        }
      }
    ]
  })
}

resource "random_string" "this" {
  length  = 6
  numeric = false
  upper   = false
  special = false
}

data "aws_caller_identity" "current" {}
