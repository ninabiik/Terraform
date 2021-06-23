resource "aws_glue_catalog_database" "glue_landing_database" {
  name = var.glue_landing_catalog_name
}

resource "aws_glue_catalog_database" "glue_processed_database" {
  name = var.glue_processed_catalog_name
}