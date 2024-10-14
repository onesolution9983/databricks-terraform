# Databricks Job Module

This module manages Databricks jobs using Terraform. It allows you to define and configure jobs that can run on Databricks clusters, including specifying libraries, parameters, and other job settings.

## Table of Contents

- [Overview](#overview)
- [Usage](#usage)
- [Input Variables](#input-variables)
- [Output Values](#output-values)
- [Examples](#examples)
- [Requirements](#requirements)
- [License](#license)

## Overview

The Databricks Job module provides a way to create and manage jobs in Databricks. It abstracts the complexity of job configuration and allows users to define jobs in a reusable manner.

## Usage

To use this module, include it in your Terraform configuration as follows:
```hcl
module "databricks_job_example" {
source = "../modules/databricks_job"
job_name = "example-job"
cluster_id = "your-cluster-id"
notebook_path = "/path/to/your/notebook"
libraries = ["jar", "python"]
timeout_seconds = 3600
new_cluster_config = {
num_workers = 2
spark_version = "7.3.x-scala2.12"
node_type_id = "i3.xlarge"
}
}
```


## Input Variables

| Variable                     | Description                                           | Type   | Default Value |
|------------------------------|-------------------------------------------------------|--------|---------------|
| `job_name`                   | The name of the Databricks job                       | string | n/a           |
| `cluster_id`                 | The ID of the cluster on which the job will run      | string | n/a           |
| `notebook_path`              | The path to the notebook to run                       | string | n/a           |
| `libraries`                  | List of libraries to install before running the job  | list   | `[]`          |
| `timeout_seconds`            | The timeout for the job in seconds                   | number | 3600          |
| `new_cluster_config`         | Configuration for a new cluster (map)                | map    | n/a           |

## Output Values

| Output                      | Description                                           |
|-----------------------------|-------------------------------------------------------|
| `job_id`                    | The ID of the created Databricks job                 |
| `job_run_id`                | The ID of the last run of the job                     |

## Examples

### Example 1: Basic Job Configuration
```hcl
module "basic_databricks_job" {
source = "../modules/databricks_job"
job_name = "basic-job"
cluster_id = "test-cluster-id"
notebook_path = "/Users/your_user@example.com/your_notebook"
}
```

### Example 2: Job with Libraries
```hcl
module "job_with_libraries" {
source = "../modules/databricks_job"
job_name = "job-with-libraries"
cluster_id = "test-cluster-id"
notebook_path = "/Users/your_user@example.com/your_notebook"
libraries = ["dbfs:/path/to/your/library.jar"]
}
```

## Requirements

- Terraform version >= 0.12
- Databricks provider version >= 1.53.0