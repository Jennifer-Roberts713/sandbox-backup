variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}