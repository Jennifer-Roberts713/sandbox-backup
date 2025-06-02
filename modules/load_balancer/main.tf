resource "google_compute_backend_bucket" "frontend" {
  name        = "shopeasy-frontend-backend"
  bucket_name = var.frontend_bucket
  enable_cdn  = true
}

resource "google_compute_url_map" "lb" {
  name            = "shopeasy-lb"
  default_service = google_compute_backend_bucket.frontend.self_link
}

resource "google_compute_target_https_proxy" "https_proxy" {
  name             = "shopeasy-https-proxy"
  url_map          = google_compute_url_map.lb.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.certificate.self_link]
}

resource "google_compute_managed_ssl_certificate" "certificate" {
  name = "shopeasy-ssl-cert"
  managed {
    domains = ["your-domain.com"] # Replace with your domain
  }
}

resource "google_compute_global_forwarding_rule" "https" {
  name       = "shopeasy-https-rule"
  target     = google_compute_target_https_proxy.https_proxy.self_link
  port_range = "443"
}