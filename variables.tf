variable "config" {
  description = "Object of inputs for AWS Config service"
  type = object({
    configuration_recorder = object({
      name       = string
      is_enabled = optional(bool, true)

      role = optional(object({
        arn = string
      }))

      recording_group = optional(object({
        all_supported                 = optional(bool, true)
        include_global_resource_types = optional(bool)
        resource_types                = optional(list(string))

        exclusion_by_resource_types = optional(object({
          resource_types = list(string)
        }))

        recording_strategy = optional(object({
          use_only = string
        }))
      }))

      recording_mode = optional(object({
        recording_frequency = string

        recording_mode_override = optional(object({
          description         = optional(string)
          resource_types      = list(string)
          recording_frequency = string
        }))
      }))
    })

    delivery_channel = object({
      s3_bucket_name = string
      s3_key_prefix  = optional(string)
      s3_kms_key_arn = optional(string)
      sns_topic_arn  = optional(string)

      snapshot_delivery_properties = optional(object({
        delivery_frequency = string
      }))
    })
  })
}
