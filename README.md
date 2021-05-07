# terraform-aws-tardigrade-config

Manage AWS Config


<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.config_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_bucket"></a> [config\_bucket](#input\_config\_bucket) | Name of S3 bucket for AWS Config inventory; bucket must already exist | `string` | n/a | yes |
| <a name="input_exclude_resource_types"></a> [exclude\_resource\_types](#input\_exclude\_resource\_types) | A list of specific resource types for AWS Config to not records changes to. This variable is mutually exclusive from `include_resource_types` and if both are set, `include_resource_types` will take priority. See AWS documenation for types https://docs.aws.amazon.com/config/latest/APIReference/API_ResourceIdentifier.html#config-Type-ResourceIdentifier-resourceType | `list(string)` | `[]` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | ARN for the IAM role to attach to the config recorder. If blank, a minimal role will be created | `string` | `null` | no |
| <a name="input_include_resource_types"></a> [include\_resource\_types](#input\_include\_resource\_types) | A list of specific resource types for AWS Config to records changes to. See AWS documenation for types https://docs.aws.amazon.com/config/latest/APIReference/API_ResourceIdentifier.html#config-Type-ResourceIdentifier-resourceType | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the AWS Config recorder | `string` | `"default"` | no |
| <a name="input_snapshot_delivery_frequency"></a> [snapshot\_delivery\_frequency](#input\_snapshot\_delivery\_frequency) | Frequency with which AWS Config recurringly delivers configuration snapshots, see <https://docs.aws.amazon.com/config/latest/APIReference/API_ConfigSnapshotDeliveryProperties.html#API_ConfigSnapshotDeliveryProperties_Contents> | `string` | `"TwentyFour_Hours"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to apply to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config_delivery_channel_id"></a> [config\_delivery\_channel\_id](#output\_config\_delivery\_channel\_id) | The name of the AWS Config delivery channel |
| <a name="output_config_iam_role_arn"></a> [config\_iam\_role\_arn](#output\_config\_iam\_role\_arn) | The Amazon Resource Name (ARN) of the config service role |
| <a name="output_config_iam_role_name"></a> [config\_iam\_role\_name](#output\_config\_iam\_role\_name) | The name of the config service role |
| <a name="output_config_recorder_id"></a> [config\_recorder\_id](#output\_config\_recorder\_id) | The name of the AWS Config recorder |
| <a name="output_config_sns_topic_arn"></a> [config\_sns\_topic\_arn](#output\_config\_sns\_topic\_arn) | The Amazon Resource Name (ARN) of the config SNS topic |

<!-- END TFDOCS -->
