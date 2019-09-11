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

module "baseline" {
  source = "../../"
  providers = {
    aws = aws
  }

  create_config = true
  name          = "tardigrade-config-${random_string.this.result}"
  account_id    = data.aws_caller_identity.current.account_id
  config_bucket = aws_s3_bucket.this.id
}
