terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.53.0"
    }
  }
  required_version = ">= 0.12"
}

provider "databricks" {
  # Configuration for Databricks provider
  host  = var.databricks_host
  token = var.databricks_token
}

module "databricks_job_example" {
  source = "./modules/databricks_job"

  job_name = "example-job"
  cluster_definition = {
    num_workers   = 2
    spark_version = "7.3.x-scala2.12"
    node_type_id  = "Standard_DS3_v2"
  }
  task = {
    jar = "dbfs:/path/to/your/jarfile.jar"
  }
  default_storage_account     = "defaultstorageaccount"
  custom_storage_account      = "customstorageaccount"
  default_storage_account_key = var.default_storage_account_key
  custom_storage_account_key  = var.custom_storage_account_key
  secret_scope                = var.secret_scope
  secret_key                  = var.secret_key
  additional_spark_conf = {
    "spark.executor.memory" = "4g"
    "spark.driver.memory"   = "4g"
  }
  // Removed log_analytics_workspace_id as it is not expected
  // log_analytics_workspace_id = var.log_analytics_workspace_id
}

module "databricks_job_another_example" {
  source = "./modules/databricks_job"

  job_name = "another-example-job"
  cluster_definition = {
    num_workers   = 3
    spark_version = "7.3.x-scala2.12"
    node_type_id  = "Standard_DS4_v2"
  }
  task = {
    jar = "dbfs:/path/to/another/jarfile.jar"
  }
  default_storage_account     = "defaultstorageaccount"
  custom_storage_account      = "anothercustomstorageaccount"
  default_storage_account_key = var.default_storage_account_key
  custom_storage_account_key  = var.custom_storage_account_key
  secret_scope                = var.secret_scope
  secret_key                  = var.secret_key
  additional_spark_conf = {
    "spark.executor.memory" = "6g"
    "spark.driver.memory"   = "6g"
  }
  // Removed log_analytics_workspace_id as it is not expected
  // log_analytics_workspace_id = var.log_analytics_workspace_id
}
