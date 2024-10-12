terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.53.0"
    }
  }
}

resource "databricks_job" "this" {
  name = var.job_name

  new_cluster {
    num_workers  = var.cluster_definition.num_workers
    spark_version = var.cluster_definition.spark_version
    node_type_id = var.cluster_definition.node_type_id

    spark_conf = merge(
      {
        "spark.hadoop.fs.azure" = "org.apache.hadoop.fs.azure.NativeAzureFileSystem",
        "spark.hadoop.fs.azure.account.key.${var.default_storage_account}.blob.core.windows.net" = var.default_storage_account_key,
        "spark.hadoop.fs.azure.account.key.${var.custom_storage_account}.blob.core.windows.net" = var.custom_storage_account_key,
      },
      var.additional_spark_conf
    )
  }

  library {
    jar = var.task.jar
  }

  timeout_seconds = 3600  
}
