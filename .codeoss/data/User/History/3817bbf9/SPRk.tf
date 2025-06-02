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
