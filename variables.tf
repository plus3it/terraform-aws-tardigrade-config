variable "name" {
  description = "Name of the AWS Config recorder"
  type        = string
  default     = "default"
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
  default     = null
}

variable "include_resource_types" {
  description = "A list of specific resource types for AWS Config to records changes to. See AWS documenation for types https://docs.aws.amazon.com/config/latest/APIReference/API_ResourceIdentifier.html#config-Type-ResourceIdentifier-resourceType"
  type        = list(string)
  default     = []
}

variable "exclude_resource_types" {
  description = "A list of specific resource types for AWS Config to not records changes to. This variable is mutually exclusive from `include_resource_types` and if both are set, `include_resource_types` will take priority. See AWS documenation for types https://docs.aws.amazon.com/config/latest/APIReference/API_ResourceIdentifier.html#config-Type-ResourceIdentifier-resourceType"
  type        = list(string)
  default     = []
}

variable "config_bucket" {
  description = "Name of S3 bucket for AWS Config inventory; bucket must already exist"
  type        = string
  default     = null
}

variable "snapshot_delivery_frequency" {
  description = "Frequency with which AWS Config recurringly delivers configuration snapshots, see <https://docs.aws.amazon.com/config/latest/APIReference/API_ConfigSnapshotDeliveryProperties.html#API_ConfigSnapshotDeliveryProperties_Contents>"
  type        = string
  default     = "TwentyFour_Hours"
}

variable "iam_role_arn" {
  description = "(Optional) ARN for the IAM role to attach to the config recorder. If blank, a minimal role will be created"
  type        = string
  default     = null
}

variable "tags" {
  description = "Map of tags to apply to the resources"
  type        = map(string)
  default     = {}
}
