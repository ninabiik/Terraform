module "s3_deployment" {
  source                          = "./modules/s3"
  #kms_key_deletion_window_in_days = var.kms_key_deletion_window_in_days
  landing_bucket_name             = var.landing_bucket_name
  process_bucket_name             = var.process_bucket_name
  glue_script_bucket_name         = var.glue_script_bucket_name
}

module "iam_deployment" {
  source = "./modules/iam"
}

module "ssm_deployment" {
  source = "./modules/ssm"
  lambdaSecret = var.lambdaSecret
  lambda_SSM_folder_name = var.lambda_SSM_folder_name
}

module "cloudwatch_deployment" {
  source                    = "./modules/cloudwatch"
  glue_cloudwatch_logs_name = var.glue_cloudwatch_logs_name
  glue_logs_retention_days  = var.glue_logs_retention_days
}


module "etl_trigger_deployment" {
  source                    = "./modules/lambda"
  etl_trigger_name          = var.etl_trigger_name
  lambda_iam_role_arn       = module.iam_deployment.lambda_iam_role_arn
  landing_bucket_source_arn = module.s3_deployment.landing_bucket_source_arn
  landing_bucket_id         = module.s3_deployment.landing_bucket_id
  glue_workflow_name        = module.glue_deployment.glue_workflow_name
  aws_region = var.aws_region
  lambda_SSM_folder_name = var.lambda_SSM_folder_name
}


module "glue_deployment" {
  source                      = "./modules/glue"
  glue_process_job_name       = var.glue_process_job_name
  glue_landing_crawler_name   = var.glue_landing_crawler_name
  glue_processed_crawler_name = var.glue_processed_crawler_name
  glue_landing_catalog_name   = var.glue_landing_catalog_name
  glue_processed_catalog_name = var.glue_processed_catalog_name
  landing_trigger_name        = var.landing_trigger_name
  landing_trigger_type        = var.landing_trigger_type
  process_job_trigger_name    = var.process_job_trigger_name
  process_trigger_name        = var.process_trigger_name
  glue_workflow_name          = var.glue_workflow_name
  glue_iam_role_arn           = module.iam_deployment.glue_iam_role_arn
  glue_cloudwatch_logs        = module.cloudwatch_deployment.glue_cloudwatch_logs
  landing_bucket_id         = module.s3_deployment.landing_bucket_id
  glue_script_bucket_id       = module.s3_deployment.glue_script_bucket_id
  process_bucket_id           = module.s3_deployment.process_bucket_id
}

