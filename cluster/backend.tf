terraform {
  backend "gcs" {
    bucket = "cs-demo-feb"
    prefix = "gke-dev"
  }
}
