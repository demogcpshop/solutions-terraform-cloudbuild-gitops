module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  name    = "example-router"
  project = "${var.project}"
  region  = "${var.region}"
  network = "default"
}