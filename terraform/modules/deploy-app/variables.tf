variable "function_name" {
  description = "Name of the Cloud Function"
  type        = string
}
variable "function_entry_point" {
  description = "Cloud Function Entrypoint"
  type        = string
}

variable "bucket_name" {
  description = "Bucket where the archive is stored"
  type        = string
}

variable "bucket_object" {
  description = "Archive object name"
  type        = string
}
