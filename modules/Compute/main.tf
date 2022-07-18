resource "google_compute_instance" "instance_1" {

  machine_type = "${var.machine_type}"
  name         = "${var.env}-test_instance"

  project = "norse-ward-356309"

  service_account {
  scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  zone = "${var.zone}"
}
# terraform import google_compute_instance.instance_1 projects/norse-ward-356309/zones/europe-west1-b/instances/instance-1