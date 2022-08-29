provider "aws" {
}
resource "aws_ssm_document" "aws_patch_base_line" {
  name            = var.document_name
  document_format = "YAML"
  document_type   = "Automation"

  content = <<DOC
        schemaVersion: '0.3'
        assumeRole: '${var.AutomationAssumeRole}'
        parameters:
          AutomationAssumeRole:
            type: String
            description: The ARN of the Automation service role to assume.
          Operation:
            type: String
            default: Scan
          RebootOption:
            type: String
            default: RebootIfNeeded
          InstallOverrideList:
            type: String
            default: ""
          SnapshotId:
            type: String
            default: ""
        mainSteps:
          - name: runPatchBaseline
            action: 'aws:runCommand'
            timeoutSeconds: 7200
            onFailure: Abort
            inputs:
              DocumentName: '${var.document_name}'
              Targets:
              - Key: 'resource-groups:Name'
                Values:
                  - '${var.ResourceGroupName}'
              Parameters:
                Operation: '${var.Operation}'
                RebootOption: '${var.RebootOption}'
                SnapshotId: '${var.SnapshotId}'
                InstallOverrideList: '${var.InstallOverrideList}'
              OutputS3BucketName: '${var.ExecutionLogsBucket}'
              OutputS3KeyPrefix: 'patching/accountid=${var.ACCOUNT_ID}/region=${var.REGION}/executionid=${var.EXECUTION_ID}'
              MaxConcurrency: '${var.MaximumConcurrency}'
              MaxErrors: '${var.MaximumErrors}'
DOC
}
