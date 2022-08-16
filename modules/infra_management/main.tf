resource "google_service_account" "sa-name" {
  #account_id = "sa-name"
  display_name = "mtn-adam-${var.opco}-${var.USE_CASE}"
}

resource "google_project_iam_member" "firestore_owner_binding" {
  #project = <your_gcp_project_id_here>
  role    = "roles/clouddeploy.admin"
  member  = "serviceAccount:${google_service_account.sa-name.email}"
}

resource "google_project_iam_member" "firestore_owner_binding" {
  #project = <your_gcp_project_id_here>
  role    = "roles/projectbilling.manager"
  member  = "serviceAccount:${google_service_account.sa-name.email}"
}

resource "google_project_iam_member" "firestore_owner_binding" {
  #project = <your_gcp_project_id_here>
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.sa-name.email}"
}

resource "google_storage_bucket" "auto-expire" {
  name          = "mtn-adam-${var.opco}-${var.USE_CASE}-bucket"
  location      = "US"
}

resource "google_storage_bucket" "auto-expire" {
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
  bucket = google_storage_bucket.default.name
  role = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.sa-name.email}"
}