variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "playground-s-11-9236d5e5"  # Add default value here
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}