resource "google_compute_instance" "notebook-test-1" {
 # attached_disk {
 #  device_name = "data"
 #   mode        = "READ_WRITE"
 #   source      = "https://www.googleapis.com/compute/v1/projects/${var.project}/zones/${var.zone}/disks/notebook-test-1-data"
 # }

 boot_disk {
   auto_delete = true
   device_name = "boot"

  initialize_params {
    image = "https://www.googleapis.com/compute/beta/projects/deeplearning-platform-release/global/images/tf-2-8-cu113-notebooks-v20220701-debian-10"

     labels = {
      goog-caip-notebook-volume = ""
     }

    size = 100
     type = "pd-standard"
  }

  # mode   = "READ_WRITE"
  # source = "https://www.googleapis.com/compute/v1/projects/${var.project}/zones/${var.zone}/disks/notebook-test-1-boot"
  }

  labels = {
    goog-caip-notebook = ""
  }

  machine_type = "n1-standard-1"

  metadata = {
    framework               = "TensorFlow:2.8"
    title                   = "TensorFlow2.8/Keras.CUDA11.3.GPU"
    shutdown-script         = "/opt/deeplearning/bin/shutdown_script.sh"
    proxy-url               = "2842483a37035983-dot-${var.region}.notebooks.googleusercontent.com"
    proxy-mode              = "service_account"
    notebooks-api           = "PROD"
    restriction             = ""
    report-system-health    = "true"
    enable-guest-attributes = "TRUE"
    version                 = "94"
  }

  name = "${var.env}-notebook-test-1"

  network_interface {
    access_config {
      #nat_ip       = "35.230.3.109"
      network_tier = "PREMIUM"
    }

    network            = "https://www.googleapis.com/compute/v1/projects/${var.project}/global/networks/default"
    network_ip         = "10.138.0.5"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/${var.project}/regions/${var.region}/subnetworks/default"
    subnetwork_project = "${var.project}"
  }

  project = "${var.project}"

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    #provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "64091002852-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform", "https://www.googleapis.com/auth/userinfo.email"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
  }

  tags = ["deeplearning-vm", "notebook-instance"]
  zone = "${var.zone}"
}
# terraform import google_compute_instance.notebook-test-1 projects/${var.project}/zones/${var.zone}/instances/${var.env}-notebook-test-1
