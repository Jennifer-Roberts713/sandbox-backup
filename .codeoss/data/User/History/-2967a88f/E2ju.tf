resource "google_sql_database_instance" "shopeasy_db" {
  name             = "shopeasy-db"
  database_version = "POSTGRES_14"
  region           = "us-central1"

  settings {
    tier = "db-g1-small"
    ip_configuration {
      ipv4_enabled = true
    }
  }

  deletion_protection = false # Disable for learning
}

resource "google_sql_database" "shopeasy" {
  name     = "shopeasy"
  instance = google_sql_database_instance.shopeasy_db.name
}

resource "google_sql_user" "postgres" {
  name     = "postgres"
  instance = google_sql_database_instance.shopeasy_db.name
  password = var.db_password # Defined in variables.tf
}