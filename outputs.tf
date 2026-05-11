output "blue_green_deployment_id" {
  value       = var.enable_blue_green ? aurora-bluegreen_deployment.main[0].deployment_id : null
  description = "Blue/Green deployment identifier (bgd-xxx)"
}

output "blue_green_status" {
  value       = var.enable_blue_green ? aurora-bluegreen_deployment.main[0].status : null
  description = "Current deployment status"
}

output "green_cluster_arn" {
  value       = var.enable_blue_green ? aurora-bluegreen_deployment.main[0].green_cluster_arn : null
  description = "ARN of the green cluster — use this to find the green endpoint for testing"
}

output "old_blue_cluster_id" {
  value       = var.enable_blue_green ? aurora-bluegreen_deployment.main[0].old_source_cluster_id : null
  description = "Cluster ID of the old blue cluster after switchover — the rollback target"
}

output "replication_status" {
  value       = var.enable_blue_green ? aurora-bluegreen_deployment.main[0].replication_status : null
  description = "Binlog replication status (NOT_CONFIGURED / SETUP_PENDING / ACTIVE / STOPPED)"
}

output "rollback_source_cluster_id" {
  value       = var.enable_blue_green ? aurora-bluegreen_deployment.main[0].rollback_source_cluster_id : ""
  description = "Non-empty after Step 1 of rollback — signals partial rollback in progress to the workflow"
}

output "rollback_completed" {
  value       = var.enable_blue_green ? aurora-bluegreen_deployment.main[0].rollback_completed : false
  description = "True after name-swap rollback finishes. Workflow skips pre-flight on re-runs when this is true."
}
