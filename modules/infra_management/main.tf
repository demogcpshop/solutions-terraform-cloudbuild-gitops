resource "google_service_account" "sa-infra" {
  account_id = "sa-infra"
  display_name = "mtn-adam-${var.OPCO}-${var.USE_CASE}"
}

resource "google_project_iam_member" "infra_role_clouddeploy" {
  #project = <your_gcp_project_id_here>
  role    = "roles/clouddeploy.admin"
  member  = "serviceAccount:${google_service_account.sa-infra.email}"
}

resource "google_project_iam_member" "infra_role_project" {
  #project = <your_gcp_project_id_here>
  role    = "roles/projectbilling.manager"
  member  = "serviceAccount:${google_service_account.sa-infra.email}"
}

resource "google_project_iam_member" "infra_role_editor" {
  #project = <your_gcp_project_id_here>
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.sa-infra.email}"
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

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.tf-state
  role = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.sa-infra.email}"
}