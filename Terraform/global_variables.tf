####Provider variables
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "access_key" {
  type    = string
  sensitive = true
}

variable "secret_key" {
  type    = string
  sensitive = true
}


####S3 Global variables
variable "kms_key_deletion_window_in_days" {
  type    = number
  default = 10
}

variable "landing_bucket_name" {
  type = string
}

variable "process_bucket_name" {
  type = string
}

variable "glue_script_bucket_name" {
  type = string
}



####Lambda Global variables
variable "etl_trigger_name" {
  type = string
}


####Glue Global variables
variable "glue_landing_crawler_name" {
  type = string
}

variable "glue_processed_crawler_name" {
  type = string
}

variable "glue_process_job_name" {
  type = string
}

variable "glue_landing_catalog_name" {
  type = string
}

variable "glue_processed_catalog_name" {
  type = string
}

variable "landing_trigger_name" {
  type = string
}

variable "landing_trigger_type" {
  type = string
}

variable "process_job_trigger_name" {
  type = string
}

variable "process_trigger_name" {
  type = string
}

variable "glue_workflow_name" {
  type = string
}

####Cloudwatch Global variables

variable "glue_cloudwatch_logs_name" {
  type = string
}

variable "glue_logs_retention_days" {
  type    = string
  default = 14
}

####SSM Global Variables
variable "lambdaSecret" {
    type = string
    sensitive = true
}

variable "lambda_SSM_folder_name" {
    type = string
    description = "Folder Name"
}