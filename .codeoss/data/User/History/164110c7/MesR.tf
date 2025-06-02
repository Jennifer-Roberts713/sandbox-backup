resource "google_sql_database_instance" "main" {
  project          = var.project_id  # Add this line
  name             = "shopeasy-db"
  database_version = "POSTGRES_14"
  region           = var.region      # This should use the variable

  settings {
    tier = "db-g1-small"
    ip_configuration {
      ipv4_enabled = true
    }
  }
}

resource "google_sql_user" "postgres" {
  project  = var.project_id  # Add this line
  name     = "postgres"
  instance = google_sql_database_instance.main.name
  password = var.db_password
}