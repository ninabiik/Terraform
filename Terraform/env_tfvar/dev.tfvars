####Provider Variables
aws_region = "us-east-1"
access_key = "ppp"
secret_key = "ppp"

#####S3 Variables
kms_key_deletion_window_in_days = "10"
landing_bucket_name             = "landing-bucket-tf-0422"
process_bucket_name             = "process-bucket-tf-0422"
glue_script_bucket_name         = "glue-script-bucket-tf-0422"


######Lambda Variables
etl_trigger_name = "etl-trigger-dev"

######Glue Variables
glue_process_job_name       = "process_glue_job_dev"
glue_landing_crawler_name   = "landing_crawler_dev"
glue_processed_crawler_name = "processed_crawler_dev"
glue_landing_catalog_name   = "terraform_landing_db_dev"
glue_processed_catalog_name = "terraform_processed_db_dev"
landing_trigger_name        = "glue_landing_trigger_dev"
landing_trigger_type        = "ON_DEMAND"
process_job_trigger_name    = "process_dev_trigger_dev"
process_trigger_name        = "glue_process_trigger_dev"
glue_workflow_name          = "glue_workflow_dev"

####Cloudwatch Variables
glue_cloudwatch_logs_name = "glue_cloudwatch_logs_dev"
glue_logs_retention_days  = "14"

####Parameter Store Variables
lambdaSecret = "This is super secret"
lambda_SSM_folder_name = "/development/etl_trigger/secret"