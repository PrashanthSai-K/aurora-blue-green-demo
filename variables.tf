variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "source_cluster_arn" {
  description = "ARN of the existing Aurora cluster to run Blue/Green on. Fixed for the entire lifecycle — does not change after switchover or rollback."
  type        = string
}

variable "target_parameter_group_name" {
  description = "DB cluster parameter group name for the green cluster. Must exist in the same region. Use the same group as the source cluster if no changes are needed."
  type        = string
}

variable "deployment_name" {
  description = "Name prefix for the B/G deployment object."
  type        = string
}

variable "green_engine_version" {
  description = "Aurora MySQL engine version for green. Leave empty to use the same version as the source cluster (no engine upgrade)."
  type        = string
  default     = ""
}

variable "enable_blue_green" {
  description = "Set true to create the green cluster. Set false to skip B/G entirely."
  type        = bool
  default     = false
}

variable "trigger_switchover" {
  description = "Set true to trigger the B/G switchover (green becomes production)."
  type        = bool
  default     = false
}

variable "trigger_rollback" {
  description = "Set true to perform a name-swap rollback — restores the original cluster endpoint."
  type        = bool
  default     = false
}

variable "delete_old_cluster" {
  description = "Set true (after switchover, happy path) to delete the old blue cluster via the provider."
  type        = bool
  default     = false
}

variable "delete_cluster_after_rollback" {
  description = "Set true (after rollback completes) to delete the <orig>-new1 cluster."
  type        = bool
  default     = false
}

variable "delete_source_cluster" {
  description = "If true, Delete() removes the old blue cluster from AWS. Keep false for rollback safety."
  type        = bool
  default     = false
}
