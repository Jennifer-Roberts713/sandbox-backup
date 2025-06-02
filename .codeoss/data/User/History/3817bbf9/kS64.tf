# 1. Create Project
resource "google_project" "shopeasy" {
  name            = "shopeasy-ecommerce"
  project_id      = var.project_id
  billing_account = var.billing_account
}

# 2. Enable APIs
resource "google_project_service" "apis" {
  for_each = toset([
    "cloudbuild.googleapis.com",
    "run.googleapis.com",
    "sql-component.googleapis.com",
    "storage.googleapis.com",
    "cdn.googleapis.com"
  ])
  project = google_project.shopeasy.project_id
  service = each.key
}

# 3. Set Budget ($50/month)
resource "google_billing_budget" "shopeasy_budget" {
  billing_account = var.billing_account
  display_name    = "ShopEasy Budget"

  budget_filter {
    projects = ["projects/${google_project.shopeasy.number}"]
  }

  amount {
    specified_amount {
      currency_code = "USD"
      units        = "50"
    }
  }

  threshold_rules {
    threshold_percent = 0.8
    spend_basis      = "CURRENT_SPEND"
  }
}