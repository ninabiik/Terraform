resource "aws_glue_crawler" "landing_crawler" {
  database_name = var.glue_landing_catalog_name
  name          = var.glue_landing_crawler_name
  role          = var.glue_iam_role_arn #aws_iam_role.glue_role.arn

  configuration = jsonencode(
    {
      Grouping = {
        TableGroupingPolicy = "CombineCompatibleSchemas"
      }
      CrawlerOutput = {
        Partitions = { AddOrUpdateBehavior = "InheritFromTable" }
      }
      Version = 1
    }
  )

  s3_target {
    path = "s3://${var.landing_bucket_id}/triggerfile/*"
  }
}


# resource "aws_glue_crawler" "catalog_crawler" {
#   database_name = var.glue_processed_catalog_name
#   name          = var.glue_processed_crawler_name
#   role          = var.glue_iam_role_arn

#   catalog_target {
#     database_name = var.glue_landing_catalog_name
#     tables        = ["${var.process_bucket_id}"]
#   }

#   schema_change_policy {
#     delete_behavior = "LOG"
#   }

#   configuration = jsonencode(
#     {
#       Grouping = {
#         TableGroupingPolicy = "CombineCompatibleSchemas"
#       }
#       CrawlerOutput = {
#         Partitions = { AddOrUpdateBehavior = "InheritFromTable" }
#       }
#       Version = 1
#     }
#   )
# }

