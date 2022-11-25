provider "google" {
  project     = var.gkeproject
  region      = var.gkeregion
}

terraform {
  backend "gcs" {
    bucket = "ideasmandar/gke-state"
    prefix = "env/dev"
  }
}