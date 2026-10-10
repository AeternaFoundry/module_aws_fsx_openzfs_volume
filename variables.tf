variable "fsx_openzfs_volumes" {
  description = <<EOT
Map of fsx_openzfs_volumes, attributes below
Required:
    - name
    - parent_volume_id
Optional:
    - copy_tags_to_snapshots
    - data_compression_type
    - delete_volume_options
    - read_only
    - record_size_kib
    - region
    - storage_capacity_quota_gib
    - storage_capacity_reservation_gib
    - tags
    - tags_all
    - volume_type
    - nfs_exports (block):
        - client_configurations (required, block):
            - clients (required)
            - options (required)
    - origin_snapshot (block):
        - copy_strategy (required)
        - snapshot_arn (required)
    - user_and_group_quotas (block):
        - id (required)
        - storage_capacity_quota_gib (required)
        - type (required)
EOT

  type = map(object({
    name                             = string
    parent_volume_id                 = string
    copy_tags_to_snapshots           = optional(bool)
    data_compression_type            = optional(string)
    delete_volume_options            = optional(list(string))
    read_only                        = optional(bool)
    record_size_kib                  = optional(number)
    region                           = optional(string)
    storage_capacity_quota_gib       = optional(number)
    storage_capacity_reservation_gib = optional(number)
    tags                             = optional(map(string))
    tags_all                         = optional(map(string))
    volume_type                      = optional(string)
    nfs_exports = optional(object({
      client_configurations = list(object({
        clients = string
        options = list(string)
      }))
    }))
    origin_snapshot = optional(object({
      copy_strategy = string
      snapshot_arn  = string
    }))
    user_and_group_quotas = optional(list(object({
      id                         = number
      storage_capacity_quota_gib = number
      type                       = string
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.fsx_openzfs_volumes : (
        v.nfs_exports == null || (length(v.nfs_exports.client_configurations) >= 1 && length(v.nfs_exports.client_configurations) <= 25)
      )
    ])
    error_message = "Each client_configurations list must contain between 1 and 25 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_openzfs_volumes : (
        v.nfs_exports == null || (alltrue([for item in v.nfs_exports.client_configurations : ((length(item.clients) >= 1 && length(item.clients) <= 128) && (can(regex("^[ -~]{1,128}$", item.clients))))]))
      )
    ])
    error_message = "all of: must be between 1 and 128 characters; must be either IP Address or CIDR"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_openzfs_volumes : (
        v.nfs_exports == null || (alltrue([for item in v.nfs_exports.client_configurations : (alltrue([for x in item.options : length(x) >= 1 && length(x) <= 128]))]))
      )
    ])
    error_message = "must be between 1 and 128 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_openzfs_volumes : (
        v.origin_snapshot == null || ((length(v.origin_snapshot.snapshot_arn) >= 8 && length(v.origin_snapshot.snapshot_arn) <= 512) && (can(regex("^arn:.*", v.origin_snapshot.snapshot_arn))))
      )
    ])
    error_message = "all of: must be between 8 and 512 characters; must specify the full ARN of the snapshot"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_openzfs_volumes : (
        (length(v.parent_volume_id) >= 23 && length(v.parent_volume_id) <= 23) && (can(regex("^(fsvol-[0-9a-f]{17,})$", v.parent_volume_id)))
      )
    ])
    error_message = "all of: must be between 23 and 23 characters; must specify a filesystem id i.e. fs-12345678"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_openzfs_volumes : (
        v.record_size_kib == null || (contains([4, 8, 16, 32, 64, 128, 256, 512, 1024], v.record_size_kib))
      )
    ])
    error_message = "must be one of: 4, 8, 16, 32, 64, 128, 256, 512, 1024"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_openzfs_volumes : (
        v.storage_capacity_quota_gib == null || (v.storage_capacity_quota_gib >= 0 && v.storage_capacity_quota_gib <= 2147483647)
      )
    ])
    error_message = "must be between 0 and 2147483647"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_openzfs_volumes : (
        v.storage_capacity_reservation_gib == null || (v.storage_capacity_reservation_gib >= 0 && v.storage_capacity_reservation_gib <= 2147483647)
      )
    ])
    error_message = "must be between 0 and 2147483647"
  }
  validation {
    condition = alltrue([
      for k, v in var.fsx_openzfs_volumes : (
        v.user_and_group_quotas == null || alltrue([for item in v.user_and_group_quotas : (item.storage_capacity_quota_gib >= 0 && item.storage_capacity_quota_gib <= 2147483647)])
      )
    ])
    error_message = "must be between 0 and 2147483647"
  }
  # Note: 7 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

