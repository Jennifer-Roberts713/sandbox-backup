resource "google_cloud_run_service" "api" {
  name     = "shopeasy-api"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/shopeasy-api:latest"
        env {
          name  = "DB_HOST"
          value = var.db_host
        }
        env {
          name  = "DB_PASSWORD"
          value = var.db_password
        }
      }
    }
  }
}