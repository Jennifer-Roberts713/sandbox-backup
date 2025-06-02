resource "google_cloud_run_service" "api" {
  name     = "shopeasy-api"
  location = var.region
  project  = var.project_id

  template {
    spec {
      containers {
        image = var.image
        
        env {
          name  = "DB_HOST"
          value = var.db_host
        }
        env {
          name  = "DB_PASSWORD"
          value = var.db_password
        }
        ports {
          container_port = 8080
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "public_access" {
  location = google_cloud_run_service.api.location
  project  = google_cloud_run_service.api.project
  service  = google_cloud_run_service.api.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}