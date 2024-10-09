# Terraform project

databricks-terraform/
├── main.tf         
├── variables.tf    
├── output.tf       
├── modules/
│   └── databricks_job/
│       ├── main.tf         
│       ├── variables.tf    
│       ├── output.tf       

- main.tf: Entry point for our Terraform project.
- variables.tf: Variable definitions used for customizing the Terraform project.
- modules/databricks_job/: Contains the reusable module code for creating the Databricks job.