resource "google_storage_bucket" "frontend" {
  name          = "shopeasy-frontend-${var.project_id}"
  location      = "US"
  storage_class = "STANDARD"
  force_destroy = true

  # This makes all objects publicly readable by default
  uniform_bucket_level_access = false
}

resource "google_storage_bucket_object" "static_files" {
  for_each = fileset("${path.module}/build/", "**/*.*")

  name   = each.value
  source = "${path.module}/build/${each.value}"
  bucket = google_storage_bucket.frontend.name
  # Set public read access for each object
  predefined_acl = "publicRead" 
}

# Remove the google_storage_bucket_iam_binding block entirely