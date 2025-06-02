terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "playground-s-11-9236d5e5"
  region  = "us-central1"
}

# Enable required APIs
resource "google_project_service" "apis" {
  for_each = toset([
    "cloudbuild.googleapis.com",
    "run.googleapis.com", 
    "sql-component.googleapis.com",
    "storage.googleapis.com",
    "cdn.googleapis.com"
  ])
  service = each.key
}

# Set budget ($50/month)
resource "google_billing_budget" "budget" {
  billing_account = data.google_billing_account.default.id
  display_name    = "ShopEasy Budget"

  amount {
    specified_amount {
      currency_code = "USD"
      units        = "50"
    }
  }

  threshold_rules {
    threshold_percent = 0.8
  }
}

data "google_billing_account" "default" {
  display_name = "My Billing Account"
  open         = true
}