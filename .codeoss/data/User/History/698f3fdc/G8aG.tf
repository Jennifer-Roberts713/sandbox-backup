output "api_url" {
  value = module.cloudrun.service_url
}

output "frontend_url" {
  value = module.frontend.website_url
}

output "db_connection" {
  value = module.cloudsql.connection_name
}