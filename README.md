# terraform-aws-tardigrade-config

Manage AWS Config


<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | AWS Account ID | `string` | `null` | no |
| config\_bucket | Name of S3 bucket for AWS Config inventory; bucket must already exist | `string` | `null` | no |
| exclude\_resource\_types | A list of specific resource types for AWS Config to not records changes to. This variable is mutually exclusive from `include_resource_types` and if both are set, `include_resource_types` will take priority. See AWS documenation for types https://docs.aws.amazon.com/config/latest/APIReference/API_ResourceIdentifier.html#config-Type-ResourceIdentifier-resourceType | `list(string)` | `[]` | no |
| iam\_role\_arn | (Optional) ARN for the IAM role to attach to the config recorder. If blank, a minimal role will be created | `string` | `null` | no |
| include\_resource\_types | A list of specific resource types for AWS Config to records changes to. See AWS documenation for types https://docs.aws.amazon.com/config/latest/APIReference/API_ResourceIdentifier.html#config-Type-ResourceIdentifier-resourceType | `list(string)` | `[]` | no |
| name | Name of the AWS Config recorder | `string` | `"default"` | no |
| snapshot\_delivery\_frequency | Frequency with which AWS Config recurringly delivers configuration snapshots, see <https://docs.aws.amazon.com/config/latest/APIReference/API_ConfigSnapshotDeliveryProperties.html#API_ConfigSnapshotDeliveryProperties_Contents> | `string` | `"TwentyFour_Hours"` | no |
| tags | Map of tags to apply to the resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| config\_delivery\_channel\_id | The name of the AWS Config delivery channel |
| config\_iam\_role\_arn | The Amazon Resource Name (ARN) of the config service role |
| config\_iam\_role\_name | The name of the config service role |
| config\_recorder\_id | The name of the AWS Config recorder |
| config\_sns\_topic\_arn | The Amazon Resource Name (ARN) of the config SNS topic |

<!-- END TFDOCS -->
