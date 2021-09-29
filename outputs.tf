output "api_key_secret_id" {
  value       = aws_secretsmanager_secret.api_key.id
  description = "string ||| The ID of the secret containing the datadog API key"
}

output "api_key_secret_name" {
  value       = aws_secretsmanager_secret.api_key.name
  description = "string ||| The name of the secret containing the datadog API key"
}
