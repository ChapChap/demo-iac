locals {
  timestamp = formatdate("YYMMDDhhmmss", timestamp())
}

# Compress source code
data "archive_file" "source" {
  type        = "zip"
  source_dir  = "../"
  output_path = "/tmp/function-${local.timestamp}.zip"
  # excludes    = [ "../../../terraform" ]
}

# Create bucket that will host the source code
resource "google_storage_bucket" "bucket" {
  name = "${var.project}-function"
}

# Add source code zip to bucket
resource "google_storage_bucket_object" "zip" {
  # Append file MD5 to force bucket to be recreated
  name   = "source.zip#${data.archive_file.source.output_md5}"
  bucket = google_storage_bucket.bucket.name
  source = data.archive_file.source.output_path
}

# Enable Cloud Functions API
resource "google_project_service" "cf" {
  project = var.project
  service = "cloudfunctions.googleapis.com"

  disable_dependent_services = true
  disable_on_destroy         = false
}

# Enable Cloud Build API
resource "google_project_service" "cb" {
  project = var.project
  service = "cloudbuild.googleapis.com"

  disable_dependent_services = true
  disable_on_destroy         = false
}

module "deploy_app" {
  source = "../deploy-app"
  for_each = toset(var.app_version)
  
  bucket_name          = google_storage_bucket.bucket.name
  bucket_object        = google_storage_bucket_object.zip.name
  function_entry_point = var.function_entry_point
  function_name        = "${var.function_name}-${each.value}"
}