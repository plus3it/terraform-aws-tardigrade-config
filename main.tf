provider "aws" {
}

locals {
  iam_role_arn   = var.iam_role_arn == null ? join("", aws_iam_role.this.*.arn) : var.iam_role_arn
  record_all     = length(var.include_resource_types) == 0 && length(var.exclude_resource_types) == 0
  resource_types = length(var.include_resource_types) > 0 ? var.include_resource_types : setsubtract(local.all_resource_types, var.exclude_resource_types)
}

data "aws_partition" "current" {
}

data "aws_iam_policy_document" "config_assume_role" {
  count = var.create_config && var.iam_role_arn == null ? 1 : 0

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["config.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "config" {
  count = var.create_config && var.iam_role_arn == null ? 1 : 0

  statement {
    actions   = ["s3:PutObject*"]
    resources = ["arn:${data.aws_partition.current.partition}:s3:::${var.config_bucket}/AWSLogs/${var.account_id}/*"]

    condition {
      test     = "StringLike"
      variable = "s3:x-amz-acl"
      values   = ["bucket-owner-full-control"]
    }
  }

  statement {
    actions   = ["s3:GetBucketAcl"]
    resources = ["arn:${data.aws_partition.current.partition}:s3:::${var.config_bucket}"]
  }
}

resource "aws_iam_role" "this" {
  count = var.create_config && var.iam_role_arn == null ? 1 : 0

  name               = "terraform-config-continuous-monitoring"
  assume_role_policy = data.aws_iam_policy_document.config_assume_role[0].json
  tags               = var.tags
}

resource "aws_iam_role_policy" "this" {
  count = var.create_config && var.iam_role_arn == null ? 1 : 0

  name   = "terraform-config-continuous-monitoring"
  role   = aws_iam_role.this[0].id
  policy = data.aws_iam_policy_document.config[0].json
}

resource "aws_iam_role_policy_attachment" "this" {
  count = var.create_config && var.iam_role_arn == null ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_sns_topic" "this" {
  count = var.create_config ? 1 : 0

  name = "terraform-config-topic"
}

resource "aws_config_configuration_recorder" "this" {
  count = var.create_config ? 1 : 0

  name     = var.name
  role_arn = local.iam_role_arn

  recording_group {
    all_supported                 = local.record_all
    include_global_resource_types = local.record_all
    resource_types                = local.record_all ? [] : local.resource_types
  }

  depends_on = [
    aws_iam_role_policy.this,
    aws_iam_role_policy_attachment.this,
  ]
}

resource "aws_config_delivery_channel" "this" {
  count = var.create_config ? 1 : 0

  name           = var.name
  s3_bucket_name = var.config_bucket
  sns_topic_arn  = aws_sns_topic.this[0].arn

  snapshot_delivery_properties {
    delivery_frequency = var.snapshot_delivery_frequency
  }

  depends_on = [aws_config_configuration_recorder.this]
}

resource "aws_config_configuration_recorder_status" "this" {
  count = var.create_config ? 1 : 0

  name       = aws_config_configuration_recorder.this[0].name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.this]
}

