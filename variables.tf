variable "region" {
  description = "Datadog region to deliver logs/metrics. Choices: 'us', 'eu', or 'gov'."
  type        = string
  default     = "us"
}

variable "api_key" {
  description = "API Key to administer Datadog"
  type        = string
}
