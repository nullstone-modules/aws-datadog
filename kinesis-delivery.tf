locals {
  kinesis_log_destinations = tomap({
    us  = "https://aws-kinesis-http-intake.logs.datadoghq.com/v1/input"
    eu  = "https://aws-kinesis-http-intake.logs.datadoghq.eu/v1/input"
    gov = "https://aws-kinesis-http-intake.logs.ddog-gov.com/v1/input"
  })

  kinesis_metric_destinations = tomap({
    us = "https://awsmetrics-intake.datadoghq.com/v1/input"
    eu = "https://awsmetrics-intake.datadoghq.eu/v1/input"
  })
}

resource "aws_s3_bucket" "failed_log_delivery" {
  bucket        = "${local.resource_name}-failed-log-delivery"
  acl           = "private"
  force_destroy = true
}

resource "aws_iam_role" "log_delivery" {
  name               = "${local.resource_name}-log-delivery"
  assume_role_policy = data.aws_iam_policy_document.log_delivery_assume.json
}

data "aws_iam_policy_document" "log_delivery_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }
  }
}

resource "aws_kinesis_firehose_delivery_stream" "datadog" {
  name        = local.resource_name
  tags        = local.tags
  destination = "http_endpoint"

  s3_configuration {
    bucket_arn         = aws_s3_bucket.failed_log_delivery.arn
    role_arn           = aws_iam_role.log_delivery.arn
    buffer_size        = 5
    buffer_interval    = 300
    compression_format = "GZIP"
  }

  http_endpoint_configuration {
    url                = local.kinesis_log_destinations[var.region]
    name               = "Datadog"
    access_key         = var.api_key
    buffering_size     = 5
    buffering_interval = 300
    retry_duration     = 300
    role_arn           = aws_iam_role.log_delivery.arn
    s3_backup_mode     = "FailedDataOnly"

    request_configuration {
      content_encoding = "GZIP"
    }
  }
}