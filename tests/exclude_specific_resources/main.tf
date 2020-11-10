provider aws {
  region = "us-east-1"
}

module exclude_specific_resources {
  source = "../../"
  providers = {
    aws = aws
  }

  name          = "tardigrade-config-${random_string.this.result}"
  config_bucket = aws_s3_bucket.this.id

  exclude_resource_types = [
    "AWS::EC2::Instance",
    "AWS::CloudTrail::Trail",
  ]
}

resource random_string this {
  length  = 6
  number  = false
  upper   = false
  special = false
}

resource aws_s3_bucket this {
  bucket        = "tardigrade-config-${random_string.this.result}"
  force_destroy = true
}

data aws_caller_identity current {}
