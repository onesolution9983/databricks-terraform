variable "job_name" {
  description = "The name of the Databricks job."
  type        = string
}

variable "cluster_definition" {
  description = "Cluster configuration for the job."
  type = object({
    num_workers  = number
    spark_version = string
    node_type_id = string
  })
}

variable "task" {
  description = "The task to be performed in the job."
  type = object({
    jar = string
  })
}

variable "default_storage_account" {
  description = "The default storage account for the job."
  type        = string
}

variable "custom_storage_account" {
  description = "The custom storage account for the job."
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

variable "additional_spark_conf" {
  description = "Additional Spark configurations."
  type        = map(string)
  default     = {}
}