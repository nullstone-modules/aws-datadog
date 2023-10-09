output "datadog_region" {
  value       = var.region
  description = "string ||| The configured Datadog region for this datadog account."
}

output "api_key_secret_id" {
  value       = aws_secretsmanager_secret.api_key.id
  description = "string ||| The ID of the secret containing the Datadog API key"
}

output "api_key_secret_name" {
  value       = aws_secretsmanager_secret.api_key.name
  description = "string ||| The name of the secret containing the Datadog API key"
}

output "app_key_secret_id" {
  value       = aws_secretsmanager_secret.app_key.id
  description = "string ||| The ID of the secret containing the Datadog App key"
}

output "app_key_secret_name" {
  value       = aws_secretsmanager_secret.app_key.name
  description = "string ||| The name of the secret containing the Datadog App key"
}

// Deprecated
// Use logs_delivery_stream_arn instead
output "delivery_stream_arn" {
  value       = aws_kinesis_firehose_delivery_stream.datadog.arn
  description = "string ||| (Deprecated) The ARN of the kinesis firehose delivery stream that will forward logs to Datadog"
}

output "logs_delivery_stream_arn" {
  value       = aws_kinesis_firehose_delivery_stream.datadog.arn
  description = "string ||| The ARN of the kinesis firehose delivery stream that will forward logs to Datadog"
}

output "delivery_role_arn" {
  value       = aws_iam_role.log_delivery.arn
  description = "string ||| The ARN of the IAM Role that has permission to deliver logs and metrics to both kinesis firehose deilvery streams"
}

output "failed_delivery_bucket_arn" {
  value       = aws_s3_bucket.failed_log_delivery.arn
  description = "string ||| The ARN of the S3 bucket where failed log delivery messages are delivered"
}
