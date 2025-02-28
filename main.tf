resource "aws_config_configuration_recorder" "this" {
  name     = var.config.configuration_recorder.name
  role_arn = var.config.configuration_recorder.role == null ? aws_iam_service_linked_role.config[0].arn : var.config.configuration_recorder.role.arn

  dynamic "recording_group" {
    for_each = var.config.configuration_recorder.recording_group != null ? [var.config.configuration_recorder.recording_group] : []
    content {
      all_supported                 = recording_group.value.all_supported
      include_global_resource_types = recording_group.value.include_global_resource_types
      resource_types                = recording_group.value.resource_types

      dynamic "exclusion_by_resource_types" {
        for_each = recording_group.value.exclusion_by_resource_types != null ? [recording_group.value.exclusion_by_resource_types] : []
        content {
          resource_types = exclusion_by_resource_types.value.resource_types
        }
      }

      dynamic "recording_strategy" {
        for_each = recording_group.value.recording_strategy != null ? [recording_group.value.recording_strategy] : []
        content {
          use_only = recording_strategy.value.use_only
        }
      }
    }
  }

  dynamic "recording_mode" {
    for_each = var.config.configuration_recorder.recording_mode != null ? [var.config.configuration_recorder.recording_mode] : []
    content {
      recording_frequency = recording_mode.value.recording_frequency

      dynamic "recording_mode_override" {
        for_each = recording_mode.value.recording_mode_override != null ? [recording_mode.value.recording_mode_override] : []
        content {
          description         = recording_mode_override.value.description
          resource_types      = recording_mode_override.value.resource_types
          recording_frequency = recording_mode_override.value.recording_frequency
        }
      }
    }
  }
}

resource "aws_config_delivery_channel" "this" {
  name           = aws_config_configuration_recorder.this.name
  s3_bucket_name = var.config.delivery_channel.s3_bucket_name
  s3_key_prefix  = var.config.delivery_channel.s3_key_prefix
  s3_kms_key_arn = var.config.delivery_channel.s3_kms_key_arn
  sns_topic_arn  = var.config.delivery_channel.sns_topic_arn

  dynamic "snapshot_delivery_properties" {
    for_each = var.config.delivery_channel.snapshot_delivery_properties != null ? [var.config.delivery_channel.snapshot_delivery_properties] : []
    content {
      delivery_frequency = snapshot_delivery_properties.value.delivery_frequency
    }
  }
}

resource "aws_config_configuration_recorder_status" "this" {
  name       = aws_config_configuration_recorder.this.name
  is_enabled = var.config.configuration_recorder.is_enabled

  depends_on = [
    aws_config_delivery_channel.this,
  ]
}

resource "aws_iam_service_linked_role" "config" {
  count = var.config.configuration_recorder.role == null ? 1 : 0

  aws_service_name = "config.amazonaws.com"
}
