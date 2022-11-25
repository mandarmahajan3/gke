terraform {
  backend "gcs" {
    bucket = "ideasmandar"
    prefix = "env/dev"
  }
}