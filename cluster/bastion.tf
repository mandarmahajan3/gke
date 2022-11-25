provider "google" {
  project     = var.gkeproject
  region      = var.gkeregion
}

module "iap_bastion" {
  source = "terraform-google-modules/bastion-host/google"

  project = var.gkeproject
  zone    = "us-central1-a"
  name_prefix = "bas"
  network = var.gkevpc
  subnet  = var.gkesubnet
  members = [
        "user:mandar@ideasgcpinnovation.com",
  ]
  create_firewall_rule = true
  machine_type = "f1-micro"
  image = "projects/debian-cloud/global/images/debian-11-bullseye-v20221102"
  name = "gke-bastion"
}