resource "aws_glue_trigger" "landing_trigger" {
  name = var.landing_trigger_name
  #schedule = "cron(15 12 * * ? *)"  #<-- please use this if you will make the trigger to schedule/conditional
  type = var.landing_trigger_type    #can be set to conditional / on_demand / scheduled
  workflow_name = var.glue_workflow_name

  actions {
    crawler_name = var.glue_landing_crawler_name
  }
#   predicate {         #<-- use this line if will make this conditional trigger
#     conditions {
#       job_name = aws_glue_job.example2.name
#       state    = "SUCCEEDED"
#     }
#   }

}

resource "aws_glue_trigger" "process_job_trigger" {
  name = var.process_job_trigger_name
  #schedule = "cron(15 12 * * ? *)"  #<-- please use this if you will make the trigger to schedule/conditional
  type = "CONDITIONAL"
  workflow_name = var.glue_workflow_name

  actions {
    job_name = var.glue_process_job_name
  }
  predicate {         
    conditions {
      crawler_name = var.glue_landing_crawler_name
      crawl_state    = "SUCCEEDED"
    }
  }

}

# resource "aws_glue_trigger" "process_trigger" {
#   name = var.process_trigger_name
#   #schedule = "cron(15 12 * * ? *)"  #<-- please use this if you will make the trigger to schedule/conditional
#   type = "CONDITIONAL"

#   actions {
#     job_name = var.glue_processed_crawler_name
#   }
#   predicate {         
#     conditions {
#       job_name = var.glue_process_job_name
#       state    = "SUCCEEDED"
#     }
#   }

# }