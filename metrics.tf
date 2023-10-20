locals {
  kinesis_metric_destinations = tomap({
    us1 = "https://awsmetrics-intake.datadoghq.com/v1/input"
    us3 = "https://awsmetrics-intake.datadoghq.com/v1/input"
    us5 = "https://event-platform-intake.us5.datadoghq.com/api/v2/awsmetrics?dd-protocol=aws-kinesis-firehose"
    eu  = "https://awsmetrics-intake.datadoghq.eu/v1/input"
    ap1 = "https://event-platform-intake.ap1.datadoghq.com/api/v2/awsmetrics?dd-protocol=aws-kinesis-firehose"
    gov = "https://awsmetrics-intake.ddog-gov.com/v1/input"
  })
}

resource "aws_kinesis_firehose_delivery_stream" "metrics" {
  name = "${local.resource_name}-metrics"
  tags = local.tags
  destination = "http_endpoint"

  http_endpoint_configuration {
    url                = local.kinesis_metric_destinations[var.region]
    name               = "Datadog"
    access_key         = var.api_key
    buffering_size     = 1
    buffering_interval = 60
    retry_duration     = 60
    role_arn           = aws_iam_role.log_delivery.arn
    s3_backup_mode     = "FailedDataOnly"

    s3_configuration {
      bucket_arn         = aws_s3_bucket.failed_log_delivery.arn
      role_arn           = aws_iam_role.log_delivery.arn
      buffering_size        = 1
      buffering_interval    = 60
      compression_format = "GZIP"
    }

    request_configuration {
      content_encoding = "GZIP"

      common_attributes {
        name  = "stack"
        value = data.ns_workspace.this.stack_name
      }

      common_attributes {
        name  = "env"
        value = data.ns_workspace.this.env_name
      }
    }
  }
}
