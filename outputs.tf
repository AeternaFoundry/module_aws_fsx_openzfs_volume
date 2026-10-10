output "fsx_openzfs_volumes_id" {
  description = "Map of id values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.id if v.id != null && length(v.id) > 0 }
}
output "fsx_openzfs_volumes_arn" {
  description = "Map of arn values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "fsx_openzfs_volumes_copy_tags_to_snapshots" {
  description = "Map of copy_tags_to_snapshots values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.copy_tags_to_snapshots if v.copy_tags_to_snapshots != null }
}
output "fsx_openzfs_volumes_data_compression_type" {
  description = "Map of data_compression_type values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.data_compression_type if v.data_compression_type != null && length(v.data_compression_type) > 0 }
}
output "fsx_openzfs_volumes_delete_volume_options" {
  description = "Map of delete_volume_options values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.delete_volume_options if v.delete_volume_options != null && length(v.delete_volume_options) > 0 }
}
output "fsx_openzfs_volumes_name" {
  description = "Map of name values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.name if v.name != null && length(v.name) > 0 }
}
output "fsx_openzfs_volumes_nfs_exports" {
  description = "Map of nfs_exports values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => one(v.nfs_exports) if v.nfs_exports != null && length(v.nfs_exports) > 0 }
}
output "fsx_openzfs_volumes_origin_snapshot" {
  description = "Map of origin_snapshot values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => one(v.origin_snapshot) if v.origin_snapshot != null && length(v.origin_snapshot) > 0 }
}
output "fsx_openzfs_volumes_parent_volume_id" {
  description = "Map of parent_volume_id values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.parent_volume_id if v.parent_volume_id != null && length(v.parent_volume_id) > 0 }
}
output "fsx_openzfs_volumes_read_only" {
  description = "Map of read_only values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.read_only if v.read_only != null }
}
output "fsx_openzfs_volumes_record_size_kib" {
  description = "Map of record_size_kib values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.record_size_kib if v.record_size_kib != null }
}
output "fsx_openzfs_volumes_region" {
  description = "Map of region values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.region if v.region != null && length(v.region) > 0 }
}
output "fsx_openzfs_volumes_storage_capacity_quota_gib" {
  description = "Map of storage_capacity_quota_gib values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.storage_capacity_quota_gib if v.storage_capacity_quota_gib != null }
}
output "fsx_openzfs_volumes_storage_capacity_reservation_gib" {
  description = "Map of storage_capacity_reservation_gib values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.storage_capacity_reservation_gib if v.storage_capacity_reservation_gib != null }
}
output "fsx_openzfs_volumes_tags" {
  description = "Map of tags values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "fsx_openzfs_volumes_tags_all" {
  description = "Map of tags_all values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "fsx_openzfs_volumes_user_and_group_quotas" {
  description = "Map of user_and_group_quotas values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.user_and_group_quotas if v.user_and_group_quotas != null && length(v.user_and_group_quotas) > 0 }
}
output "fsx_openzfs_volumes_volume_type" {
  description = "Map of volume_type values across all fsx_openzfs_volumes, keyed the same as var.fsx_openzfs_volumes"
  value       = { for k, v in aws_fsx_openzfs_volume.fsx_openzfs_volumes : k => v.volume_type if v.volume_type != null && length(v.volume_type) > 0 }
}

