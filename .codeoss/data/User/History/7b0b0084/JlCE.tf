resource "google_cloud_run_service" "api" {
  name     = "shopeasy-api"
  location = var.region
  project  = var.project_id

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

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_binding" "public_access" {
  location = google_cloud_run_service.api.location
  project  = google_cloud_run_service.api.project
  service  = google_cloud_run_service.api.name
  role     = "roles/run.invoker"
  members  = ["allUsers"]
}