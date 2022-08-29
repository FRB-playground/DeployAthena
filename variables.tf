variable "AutomationAssumeRole" {
  type        = string
  default     = ""
  description = "AssumeRole for Automation"
}

variable "Operation" {
  default     = ""
  type        = string
  description = "Operation field for Parameter"
}

variable "RebootOption" {
  type        = string
  default     = ""
  description = "RebootOption field in Parameter"
}

variable "SnapshotId" {
  type        = string
  default     = ""
  description = "SnapshotId field in Parameter"
}

variable "InstallOverrideList" {
  type        = string
  default     = ""
  
}

variable "REGION" {
  type        = string
  default     = ""
  
}

variable "EXECUTION_ID" {
  type        = string
  default     = ""
  
}

variable "ACCOUNT_ID" {
  type        = string
  default     = ""
  
}

variable "document_name" {
  type        = string
  default     = "awsrunpatchbaseline"
  
}

variable "ExecutionLogsBucket" {
  type        = string
  default     = ""
  
}

variable "ResourceGroupName" {
  type        = string
  default     = ""
  
}

variable "MaximumConcurrency" {
  type        = string
  default     = ""
  
}

variable "MaximumErrors" {
  type        = string
  default     = ""
  
}
