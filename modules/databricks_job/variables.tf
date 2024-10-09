variable "job_name" {
  description = "Name of the Databricks job"
  type        = string
}

variable "cluster_definition" {
  description = "Cluster definition for the Databricks job"
  type        = map(any)
}

variable "job_task" {
  description = "The single task that the job will perform"
  type        = map(any)
}

variable "databricks_secrets" {
  description = "List of secrets to be consumed by the Databricks job"
  type        = list(object({
    scope = string,
    key   = string
  }))
}

variable "spark_config" {
  description = "Additional custom Spark configurations"
  type        = map(string)
  default     = {}
}

variable "log_analytics_workspace_id" {
  description = "Azure Log Analytics workspace ID"
  type        = string
}