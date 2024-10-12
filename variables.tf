variable "databricks_host" {
  description = "The Databricks workspace URL."
  type        = string
}

variable "databricks_token" {
  description = "The Databricks access token."
  type        = string
}

variable "default_storage_account_key" {
  description = "The access key for the default storage account."
  type        = string
}

variable "custom_storage_account_key" {
  description = "The access key for the custom storage account."
  type        = string
}

variable "secret_scope" {
  description = "The Databricks secret scope."
  type        = string
}

variable "secret_key" {
  description = "The key for the secret."
  type        = string
}