variable "solace_api_token" {
  description = "Solace Cloud API token"
  type        = string
  sensitive   = true
}

variable "broker_url" {
  type = string
  description = "The URL of the Solace broker."
}

variable "broker_username" {
  type = string
  description = "The management username of the Solace broker."
}

variable "broker_password" {
  sensitive = true
  type = string
  description = "The management password of the Solace broker."
}
