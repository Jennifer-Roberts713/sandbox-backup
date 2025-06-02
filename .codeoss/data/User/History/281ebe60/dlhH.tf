resource "google_storage_bucket" "frontend" {
  name          = "shopeasy-frontend-${var.project_id}"
  location      = "US"
  storage_class = "STANDARD"
  force_destroy = true  # Allows easy deletion (disable in production)

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_object" "static_files" {
  for_each = fileset("${path.module}/build/", "**/*.*")

  name   = each.value
  source = "${path.module}/build/${each.value}"
  bucket = google_storage_bucket.frontend.name

  # Cache settings for better performance
  cache_control = "public, max-age=3600"
}

resource "google_storage_bucket_iam_binding" "public_read" {
  bucket  = google_storage_bucket.frontend.name
  role    = "roles/storage.objectViewer"
  members = ["allUsers"]
}