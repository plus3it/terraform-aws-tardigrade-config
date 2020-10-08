provider aws {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

resource "random_string" "this" {
  length  = 6
  number  = false
  upper   = false
  special = false
}

resource "aws_s3_bucket" "this" {
  bucket        = "tardigrade-config-${random_string.this.result}"
  force_destroy = true
}

module "include_and_exclude" {
  source = "../../"
  providers = {
    aws = aws
  }

  name                   = "tardigrade-config-${random_string.this.result}"
  account_id             = data.aws_caller_identity.current.account_id
  config_bucket          = aws_s3_bucket.this.id
  include_resource_types = ["AWS::EC2::Instance", "AWS::CloudTrail::Trail"]
  exclude_resource_types = ["AWS::EC2::Instance", "AWS::CloudTrail::Trail"]
}
