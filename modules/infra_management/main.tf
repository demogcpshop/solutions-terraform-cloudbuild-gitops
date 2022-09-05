resource "google_service_account" "sa-name" {
  account_id = "sa-name"
  display_name = "SA"
}

  resource "google_project_iam_member" "firestore_owner_binding2" {
  project = "norse-ward-356309"
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.sa-name.email}"
}

resource "google_project_iam_member" "firestore_owner_binding" {
  project = "norse-ward-356309"
  role    = "roles/datastore.owner"
  member  = "serviceAccount:${google_service_account.sa-name.email}"
}

resource "google_storage_bucket" "eva" {
  name          = "mtn-adam-${var.OPCO}-${var.USE_CASE}-bucket"
  location      = "US"
}

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.eva.name
  role = "roles/storage.admin"
  members = [
    "serviceAccount:${google_service_account.sa-name.email}",
  ]
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