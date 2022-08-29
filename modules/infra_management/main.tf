# resource "google_service_account" "sa-infra" {
#   account_id = "sa-infra"
#   display_name = "mtn-adam-${var.OPCO}-${var.USE_CASE}"
# }


# resource "google_project_iam_custom_role" "sa-infra" {
#   role_id     = "myCustomRole"
#   title       = "mtn-adam-${var.OPCO}-${var.USE_CASE}e"
#   description = "A description"
#   permissions = ["appengine.applications.update", "appengine.instances.delete", "appengine.instances.get"]
# }

resource "google_service_account" "sa-infra" {
  account_id   = "sa-infra"
  display_name = "mtn-adam-${var.OPCO}-${var.USE_CASE}"
}

  
resource "google_project_iam_binding" "sa-infra" {
  #project = "${var.project}"
  role    = "roles/logging.logWriter"
  members = [
    "serviceAccount:${google_service_account.sa-infra.email}"
  ]

depends_on = [
    google_service_account.sa-infra
  ]
}


resource "google_storage_bucket" "eva" {
  name          = "mtn-adam-${var.OPCO}-${var.USE_CASE}-bucket"
  location      = "US"
}

resource "google_storage_bucket" "tf-state" {
  name          = "mtn-adam-infra-state-bucket"
  location      = "US"

  labels = {
    use_case = "test"
    opco     = "benin"
    benin    = "cloud-storage"
  }
 versioning {
    enabled = true
  }

}

#resource "google_storage_bucket_iam_member" "member" {
#  bucket = google_storage_bucket.tf-state
#  role = "roles/storage.admin"
#  member = "serviceAccount:${google_service_account.sa-infra.email}"
#}