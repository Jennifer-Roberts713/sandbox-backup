output "website_url" {
  value = "https://storage.googleapis.com/${google_storage_bucket.frontend.name}/index.html"
}

output "bucket_name" {
  value = google_storage_bucket.frontend.name
}