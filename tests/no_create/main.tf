provider aws {
  region = "us-east-1"
}

module "baseline" {
  source = "../../"
  providers = {
    aws = aws
  }

  create_config = false
}
