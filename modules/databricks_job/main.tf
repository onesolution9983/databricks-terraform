resource "databricks_job" "job" {
  name = var.job_name

  new_cluster {
    cluster_name   = var.cluster_definition["name"]
    spark_version  = var.cluster_definition["spark_version"]
    node_type_id   = var.cluster_definition["node_type_id"]
    num_workers    = var.cluster_definition["num_workers"]
    spark_conf     = local.final_spark_config

    # Driver logs streaming to storage account
    log_conf {
      dbfs {
        destination = "dbfs:/logs/driver-logs/"
      }
    }
  }

  task {
    task_key = "single-task"
    notebook_task {
      notebook_path = var.job_task["notebook_path"]
    }
  }

  # Define the Databricks secrets
  environment_variables = { 
    for secret in var.databricks_secrets : secret.key => "dbutils.secrets.get(scope = '${secret.scope}', key = '${secret.key}')"
  }
}

# Define Spark configuration merging default with custom
locals {
  default_spark_config = {
    "spark.hadoop.fs.azure.account.key.<default_storage_account>.dfs.core.windows.net" = "dbutils.secrets.get(scope = 'storage_scope', key = 'storage_key')"
    "spark.hadoop.fs.azure.account.key.<custom_storage_account>.dfs.core.windows.net"  = "dbutils.secrets.get(scope = 'custom_storage_scope', key = 'custom_storage_key')"
  }

  final_spark_config = merge(local.default_spark_config, var.spark_config)
}

# Stream job logs to Log Analytics
resource "azurerm_monitor_diagnostic_setting" "diagnostics" {
  name                       = "${var.job_name}-diagnostic-setting"
  target_resource_id         = databricks_job.job.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "jobs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 100
    }
  }
}