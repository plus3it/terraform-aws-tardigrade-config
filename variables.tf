variable "create_config" {
  description = "Controls whether to create the AWS Config"
  default     = true
}

variable "name" {
  description = "Name of the AWS Config recorder"
  type        = "string"
  default     = "default"
}

variable "account_id" {
  description = "AWS Account ID"
  type        = "string"
  default     = ""
}

variable "config_bucket" {
  description = "Name of S3 bucket for AWS Config inventory; bucket must already exist"
  type        = "string"
  default     = ""
}

variable "snapshot_delivery_frequency" {
  description = "Frequency with which AWS Config recurringly delivers configuration snapshots, see <https://docs.aws.amazon.com/config/latest/APIReference/API_ConfigSnapshotDeliveryProperties.html#API_ConfigSnapshotDeliveryProperties_Contents>"
  type        = "string"
  default     = "TwentyFour_Hours"
}

variable "iam_role_arn" {
  description = "(Optional) ARN for the IAM role to attach to the config recorder. If blank, a minimal role will be created"
  type        = "string"
  default     = ""
}

variable "tags" {
  description = "Map of tags to apply to the resources"
  type        = "map"
  default     = {}
}
