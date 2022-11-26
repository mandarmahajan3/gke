resource "google_compute_address" "ip_address" {
  name = "nat-for-gke"
}

resource "google_compute_router" "router" {
  project = var.project_id
  name    = "gke-nat-router"
  network = var.gkevpc
  region  = var.gkeregion
}

module "cloud-nat" {
  source     = "terraform-google-modules/cloud-nat/google"
  version    = "~> 1.2"
  project_id = var.gkeproject
  region     = var.gkeregion
  router     = google_compute_router.router.name
  nat_ips    = google_compute_address.ip_address
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}