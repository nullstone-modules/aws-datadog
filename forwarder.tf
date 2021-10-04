// NOTE: The Lambda forwarder is likely not necessary since we are configuring the Kinesis firehose
// In the event that we need it, I am leaving it commented out

/*
resource "aws_cloudformation_stack" "forwarder" {
  name         = "datadog-forwarder"
  capabilities = ["CAPABILITY_IAM", "CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]
  parameters = {
    DdApiKeySecretArn = aws_secretsmanager_secret.api_key.arn
    FunctionName      = "datadog-forwarder"
    DdTags            = "stack:${data.ns_workspace.this.stack_name},env:${data.ns_workspace.this.env_name}"
  }
  template_url = "https://datadog-cloudformation-template.s3.amazonaws.com/aws/forwarder/latest.yaml"
}
*/
