module "cloud-nat" {
  source     = "terraform-google-modules/cloud-nat/google"
  project_id = "${var.project}"
  region     = "${var.region}"

  depends_on = [google_compute_router.router.name]
  router     = google_compute_router.router.name
}