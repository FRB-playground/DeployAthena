provider "aws" {
  region = var.region
}

resource "aws_glue_catalog_database" "aws_glue_catalog_database" {
  name        = var.database_name
  catalog_id  = var.catalog_id
  description = "Systems Manager Global Resource Data Sync Database"
}

resource "aws_glue_crawler" "glue_crawler" {
  database_name = aws_glue_catalog_database.aws_glue_catalog_database.name
  name          = var.crawler_name
  description   = "Crawler for AWS Systems Manager Resource Data Sync"
  role          = aws_iam_role.crawler_role.arn
  schedule      = var.crawler_schedule
  s3_target {
    path = var.s3_target_path
  }
}

resource "aws_iam_role" "crawler_role" {
  name                = "SSM-GlueCrawlerRole"
  assume_role_policy  = data.aws_iam_policy_document.glue_assume_role_policy.json
  managed_policy_arns = [aws_iam_policy.s3_policy.arn]
}



data "aws_iam_policy_document" "glue_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["glue.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "s3_policy" {
  name        = "S3Actions"
  path        = "/service-role/"
  description = "created for Glue to access resource data sync S3 bucket"


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
        ]
        Effect   = "Allow"
        Resource = var.s3_bucket_arn
      },
      {
        Action = [
          "kms:Decrypt",
        ]
        Effect   = "Allow"
        Resource = var.encryption_key_arn
      },
    ]
  })
}
