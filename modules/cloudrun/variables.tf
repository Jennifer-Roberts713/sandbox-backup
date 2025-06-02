variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "db_host" {
  description = "Database private IP"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "image" {
  description = "Container image URL"
  type        = string
  default     = "gcr.io/cloudrun/hello" # Default test image
}