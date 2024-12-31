# terraform-aws-tardigrade-config

Manage AWS Config

## Testing

Manual testing:

```
# Replace "xxx" with an actual AWS profile, then execute the integration tests.
export AWS_PROFILE=xxx 
make terraform/pytest PYTEST_ARGS="-v --nomock"
```

For automated testing, PYTEST_ARGS is optional and no profile is needed:

```
make mockstack/up
make terraform/pytest PYTEST_ARGS="-v"
make mockstack/clean
```

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.38.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.38.0 |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | Object of inputs for AWS Config service | <pre>object({<br/>    configuration_recorder = object({<br/>      name       = string<br/>      is_enabled = optional(bool, true)<br/><br/>      role = optional(object({<br/>        arn = string<br/>      }))<br/><br/>      recording_group = optional(object({<br/>        all_supported                 = optional(bool, true)<br/>        include_global_resource_types = optional(bool)<br/>        resource_types                = optional(list(string))<br/><br/>        exclusion_by_resource_types = optional(object({<br/>          resource_types = list(string)<br/>        }))<br/><br/>        recording_strategy = optional(object({<br/>          use_only = string<br/>        }))<br/>      }))<br/><br/>      recording_mode = optional(object({<br/>        recording_frequency = string<br/><br/>        recording_mode_override = optional(object({<br/>          description         = optional(string)<br/>          resource_types      = list(string)<br/>          recording_frequency = string<br/>        }))<br/>      }))<br/>    })<br/><br/>    delivery_channel = object({<br/>      s3_bucket_name = string<br/>      s3_key_prefix  = optional(string)<br/>      s3_kms_key_arn = optional(string)<br/>      sns_topic_arn  = optional(string)<br/><br/>      snapshot_delivery_properties = optional(object({<br/>        delivery_frequency = string<br/>      }))<br/>    })<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_config_delivery_channel_id"></a> [config\_delivery\_channel\_id](#output\_config\_delivery\_channel\_id) | The name of the AWS Config delivery channel |
| <a name="output_config_recorder_id"></a> [config\_recorder\_id](#output\_config\_recorder\_id) | The name of the AWS Config recorder |

<!-- END TFDOCS -->
