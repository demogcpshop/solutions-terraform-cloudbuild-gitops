resource "google_service_account" "sa-infra" {
  account_id = "sa-infra"
  display_name = "mtn-adam-${var.OPCO}-${var.USE_CASE}"
}

resource "google_project_iam_member" "sa-infra" {
  #project = <your_gcp_project_id_here>
  role    = "roles/appengine.deployer"
  member  = "serviceAccount:${google_service_account.sa-infra}"
}

resource "google_project_iam_member" "sa-infra1" {
  #project = <your_gcp_project_id_here>
  role    = "roles/accesscontextmanager.policyAdmin"
  member  = "serviceAccount:${google_service_account.sa-infra}"
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