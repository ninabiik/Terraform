output "glue_cloudwatch_logs" {
    value = aws_cloudwatch_log_group.glue_job_process_logs.name
}