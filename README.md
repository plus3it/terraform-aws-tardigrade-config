# terraform-aws-tardigrade-config

Manage AWS Config


<!-- BEGIN TFDOCS -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| account\_id | AWS Account ID | `string` | n/a | yes |
| config\_bucket | Name of S3 bucket for AWS Config inventory; bucket must already exist | `string` | n/a | yes |
| iam\_role\_arn | (Optional) ARN for the IAM role to attach to the config recorder. If blank, a minimal role will be created | `string` | n/a | yes |
| create\_config | Controls whether to create the AWS Config | `bool` | `true` | no |
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
