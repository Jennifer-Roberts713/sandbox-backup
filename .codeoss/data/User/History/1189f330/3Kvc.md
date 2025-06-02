# Frontend Module

Deploys static frontend files to Google Cloud Storage.

## Inputs
- `project_id`: GCP Project ID (required)
- `environment`: Deployment environment (optional, default: dev)

## Outputs
- `website_url`: Public URL of the frontend
- `bucket_name`: Name of the created GCS bucket

## Usage
```hcl
module "frontend" {
  source     = "./modules/frontend"
  project_id = "your-project-id"
}