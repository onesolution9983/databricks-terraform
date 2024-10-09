provider "databricks" {
  host  = var.databricks_host
  token = var.databricks_token
}

module "databricks_job" {
  source = "./modules/databricks_job"

  # Different Databricks job with its configuration
  job_name           = "example-job"
  cluster_definition = {
    name          = "example-cluster"
    spark_version = "7.3.x-scala2.12"
    node_type_id  = "Standard_DS3_v2"
    num_workers   = 2
  }

  job_task = {
    notebook_path = "/Shared/example-notebook"
  }

  # Secrets from Databricks secret scope
  databricks_secrets = [
    { scope = "example-scope", key = "storage_key" },
    { scope = "custom-scope", key = "custom_storage_key" }
  ]

  # Custom Spark configurations
  spark_config = {
    "spark.executor.memory" = "4g",
    "spark.executor.cores"  = "2"
  }

  log_analytics_workspace_id = "your-log-analytics-workspace-id"
}