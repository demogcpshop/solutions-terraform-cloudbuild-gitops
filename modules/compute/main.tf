resource "google_compute_instance" "instance_1" {
  boot_disk {
    auto_delete = true
    device_name = "instance-1"

    initialize_params {
      image = "https://www.googleapis.com/compute/beta/projects/debian-cloud/global/images/debian-11-bullseye-v20220621"
      size  = 10
      type  = "pd-balanced"
    }
  }

  confidential_instance_config {
    enable_confidential_compute = false
  }

  machine_type = "${var.machine_type}"
  name         = "${var.env}-test-instance-1"

  network_interface {
    network            = "https://www.googleapis.com/compute/v1/projects/${var.project}/global/networks/default"
    #network_ip         = "10.132.0.2"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/${var.project}/regions/${var.region}/subnetworks/default"
    subnetwork_project = "${var.project}"
  }

  project = "${var.project}"
  zone = "${var.zone}"

  reservation_affinity {
    type = "ANY_RESERVATION"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    }

  service_account {
    #email  = "64091002852-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
  }


}



