# Blue/Green Deployment — standalone, manages only the B/G lifecycle.
# The source Aurora cluster is managed externally; its ARN is passed as a variable.
#
# source_cluster_arn stays the same throughout the entire lifecycle:
#   create green → switchover → rollback → cleanup
# AWS never changes the ARN of the original cluster.
#
# Lifecycle:
#   Phase 1  enable_blue_green=true                → creates green cluster (AVAILABLE)
#   Phase 2  trigger_switchover=true               → production switchover; old cluster retained
#   Rollback trigger_rollback=true                 → name-swap: new prod → <orig>-new1,
#                                                     old blue → <orig> (original endpoint restored)
#   Cleanup  delete_cluster_after_rollback=true    → deletes the <orig>-new1 cluster

resource "aurora-bluegreen_deployment" "main" {
  count = var.enable_blue_green ? 1 : 0

  deployment_name             = var.deployment_name
  source_cluster_arn          = var.source_cluster_arn
  target_engine_version       = var.green_engine_version != "" ? var.green_engine_version : null
  target_parameter_group_name = var.target_parameter_group_name

  trigger_switchover    = var.trigger_switchover
  delete_source_cluster = var.delete_source_cluster

  trigger_rollback              = var.trigger_rollback
  delete_old_cluster            = var.delete_old_cluster
  delete_cluster_after_rollback = var.delete_cluster_after_rollback

  create_timeout_minutes     = 90
  switchover_timeout_seconds = 300
}
