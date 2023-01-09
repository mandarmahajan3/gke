terraform {
  backend "gcs" {
    bucket = "cloud-studio"
    prefix = "gke-dev"
  }
}
