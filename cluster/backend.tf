terraform {
  backend "gcs" {
    bucket = "ideasmandar/gke-state"
    prefix = "env/dev"
  }
}