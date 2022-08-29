variable "region" {
  type        = string
  description = "AWS region"
  default     = "ap-south-1"
}

variable "database_name" {
  type        = string
  description = "Name of the database. The acceptable characters are lowercase letters, numbers, and the underscore character."
  default     = "ssm global_ resource_sync"
}

variable "catalog_id" {
  type        = string
  description = "ID of the Glue Catalog to create the database in. If omitted, this defaults to the AWS Account ID"
  default     = ""
}

variable "crawler_name" {
  type        = string
  description = "Name of the crawler"
  default     = "SSM-GlueCrawler"
}

variable "crawler_schedule" {
  type        = string
  description = "A cron expression used to specify the schedule. For more information, see Time-Based Schedules for Jobs and Crawlers. For example, to run something every day at 12:15 UTC, you would specify: cron(15 12 * * ? *)"
  default     = "cron(0 0 * * ? *)"
}

variable "s3_target_path" {
  type        = string
  description = "Path for S3 bucket like: s3://..."
  default     = ""
}

variable "s3_bucket_arn" {
  type        = string
  description = "ARN of S3 bucket"
  default     = ""
}

variable "encryption_key_arn" {
  type        = string
  description = "ARN of KMS encryption KEY"
  default     = ""
}
