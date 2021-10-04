variable "region" {
  description = "Datadog region to deliver logs/metrics. Choices: 'us', 'eu', or 'gov'."
  type        = string
  default     = "us"
}

variable "api_key" {
  description = "API Key to emit logs/metrics to Datadog"
  type        = string
}

variable "app_key" {
  description = "App Key to administer Datadog"
  type        = string
}
