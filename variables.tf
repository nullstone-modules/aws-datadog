variable "region" {
  description = "Datadog region to deliver logs/metrics. Choices: 'us', 'eu', or 'gov'."
  type        = string
  default     = "us"
}

variable "api_key" {
  description = "API Key to emit logs/metrics to Datadog"
  type        = string
  sensitive   = true
}

variable "app_key" {
  description = "App Key to administer Datadog"
  type        = string
  sensitive   = true
}
