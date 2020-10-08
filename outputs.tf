# Config
output "config_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) of the config service role"
  value       = join("", aws_iam_role.this.*.arn)
}

output "config_iam_role_name" {
  description = "The name of the config service role"
  value       = join("", aws_iam_role.this.*.name)
}

output "config_recorder_id" {
  description = "The name of the AWS Config recorder"
  value       = aws_config_configuration_recorder.this.id
}

output "config_delivery_channel_id" {
  description = "The name of the AWS Config delivery channel"
  value       = aws_config_delivery_channel.this.id
}

output "config_sns_topic_arn" {
  description = "The Amazon Resource Name (ARN) of the config SNS topic"
  value       = aws_sns_topic.this.arn
}

