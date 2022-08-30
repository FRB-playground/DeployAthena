variable "region" {
  type = string
  description = "AWS region"
  default = "ap-south-1"
}

variable "database_name" {
  type = string
  description = "The database to which the query belongs"
  default = ""
}

