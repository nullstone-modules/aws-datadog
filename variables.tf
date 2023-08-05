variable "region" {
  description = "Datadog region to deliver logs/metrics. Choices: 'us1', 'us3', 'us5', 'eu', or 'gov'."
  type        = string
  default     = "us1"
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
