variable "databricks_host" {
  description = "Databricks workspace URL"
  type        = string
}

variable "databricks_token" {
  description = "Databricks access token"
  type        = string
  sensitive   = true
}

variable "log_analytics_workspace_id" {
  description = "Azure Log Analytics workspace ID"
  type        = string
}