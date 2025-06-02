resource "google_storage_bucket" "frontend" {
  name          = "shopeasy-frontend-${var.project_id}"
  location      = "US"
  storage_class = "STANDARD"
  force_destroy = true

  # Required for public access
  uniform_bucket_level_access = false
}

resource "google_storage_bucket_object" "static_files" {
  for_each = fileset("${path.module}/build/", "**/*.*")

  name   = each.value
  source = "${path.module}/build/${each.value}"
  bucket = google_storage_bucket.frontend.name
}

# Make each object publicly readable using storage_object_access_control
resource "google_storage_object_access_control" "public_read" {
  for_each = fileset("${path.module}/build/", "**/*.*")

  object = google_storage_bucket_object.static_files[each.value].name
  bucket = google_storage_bucket.frontend.name
  role   = "READER"
  entity = "allUsers"
}