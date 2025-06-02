module "cloudsql" {
  source     = "./modules/cloudsql"
  project_id = var.project_id
  region     = var.region
  db_password = var.db_password
}

module "cloudrun" {
  source      = "./modules/cloudrun"
  project_id  = var.project_id
  region      = var.region
  db_host     = module.cloudsql.private_ip
  db_password = var.db_password
  image       = "gcr.io/${var.project_id}/shopeasy-api:latest" # Your custom image
  depends_on  = [module.cloudsql]
}

module "frontend" {
  source     = "./modules/frontend"
  project_id = var.project_id
}

module "load_balancer" {
  source         = "./modules/load_balancer"
  project_id     = var.project_id
  frontend_bucket = module.frontend.bucket_name
}
resource "google_project_service" "apis" {
  for_each = toset([
    "sqladmin.googleapis.com",
    "storage-component.googleapis.com"
  ])
  service = each.key
}

resource "google_project_service" "run_api" {
  service = "run.googleapis.com"
  disable_on_destroy = false
}
