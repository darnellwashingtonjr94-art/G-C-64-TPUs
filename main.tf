provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "tpu_cluster" {
  name     = "g-c-64-tpus-cluster"
  location = var.region
  initial_node_count = 1
  deletion_protection = false
}

resource "google_container_node_pool" "tpu_nodes" {
  name       = "tpu-node-pool"
  cluster    = google_container_cluster.tpu_cluster.id
  node_count = 4 

  node_config {
    machine_type = "ct4p-hightcpu-4t" # Example TPU v4 machine type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
