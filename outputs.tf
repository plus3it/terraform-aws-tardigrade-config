output "config_recorder_id" {
  description = "The name of the AWS Config recorder"
  value       = aws_config_configuration_recorder.this.id
}

output "config_delivery_channel_id" {
  description = "The name of the AWS Config delivery channel"
  value       = aws_config_delivery_channel.this.id
}
