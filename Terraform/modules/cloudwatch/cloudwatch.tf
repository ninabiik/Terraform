resource "aws_cloudwatch_log_group" "glue_job_process_logs" {
  name              = var.glue_cloudwatch_logs_name
  retention_in_days = var.glue_logs_retention_days
}