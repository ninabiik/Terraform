resource "aws_glue_job" "process_job" {
  name              = var.glue_process_job_name
  role_arn          = var.glue_iam_role_arn

  command {
        script_location = "s3://${var.glue_script_bucket_id}/CSVtoParquet.py"
    }


  default_arguments = {
    "--S3_TARGET_BUCKET"                 = "s3://${var.landing_bucket_id}/triggerfile/*"
    "--S3_PROCESS_BUCKET"                = "s3://${var.process_bucket_id}/"
    "--TempDir"                          = "s3://${var.process_bucket_id}/"
    "--continuous-log-logGroup"          = "${var.glue_cloudwatch_logs}" #aws_cloudwatch_log_group.glue_job_process_logs.name
    "--enable-continuous-cloudwatch-log" = "true"
    "--enable-continuous-log-filter"     = "true"
    "--enable-metrics"                   = ""
    "--glue_version "                    = "2.0"
    "--job-bookmark-option"              = "job-bookmark-enable"
    "--job-language"                     = "python"
  }
}