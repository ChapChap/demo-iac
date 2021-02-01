variable "region" {
  description = "Region/zone where to deploy GCP objects"
  type        = string
}

variable "project" {
  description = "GCP Project target"
  type        = string
}

variable "function_name" {
  description = "Name of the Cloud Function"
  type        = string
}
variable "function_entry_point" {
  description = "Cloud Function Entrypoint"
  type        = string
}
