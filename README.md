# Datadog

This datastore module creates a base set of infrastructure to forward logs/metrics to Datadog.

## When to use

This module is the preferred method of forward logs and metrics to Datadog from AWS infrastructure.
- **Latency:** Logs/Metrics are reported at near-real-time
- **Cost:** This sets up minimal AWS infrastructure that costs significantly less than agents or Lambda forwarders.

## Setup

This module sets up a Kinesis Firehose Stream for logs and a Kinesis Firehose Stream for metrics.
Each is configured to emit a Datadog API HTTP endpoint based on the Datadog region.

This module requires additional setup to forward logs/metrics.
Use application capabilities to forward your application's logs/metrics to Datadog.
