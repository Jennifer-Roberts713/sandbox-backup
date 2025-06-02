variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "billing_account" {
  description = "Billing account ID"
  type        = string
  sensitive   = true
}