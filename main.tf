provider "aws" {
  region=var.region
}
resource "aws_athena_named_query" "QueryNonCompliantPatch" {
  name = "QueryNonCompliantPatch"
  database = var.database_name
  query    = "SELECT   FROM  aws_ complianceitem  WHERE  status='NON COMPLIANT' AND compliancetype='Patch' Details LIMIT 20;"
}


resource "aws_athena_named_query" "QuerySSMAgentVersion" {
  name = "QuerySSMAgentVersion"
  database = var.database_name
  query    = "SELECT FROM aws application WHERE name='Amazon SSM Agent' OR name-'amazon-ssm-agent LIMIT 20;"
}

resource "aws_athena_named_query" "QuerylnstanceList" {
  name = "QuerylnstanceList"
  database = var.database_name
  query    = "SELECT FROM aws instanceinformation WHERE instancestatus IS NULL;"
}

resource "aws_athena_named_query" "QueryInstanceApplications" {
  name = "QueryInstanceApplications"
  database = var.database_name
  query    = "SELECT name applicationtype, publisher version, instanceid FROM aws application, aws instanceinformation WHERE aws instanceinformation instancestatus IS NULL;"
}