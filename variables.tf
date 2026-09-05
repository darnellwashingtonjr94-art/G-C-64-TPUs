variable "project_id" {
  description = "The GCP Project ID"
  type        = string
}

variable "region" {
  description = "The GCP region for the cluster"
  type        = string
  default     = "us-central2" # Common region for TPU availability
}
