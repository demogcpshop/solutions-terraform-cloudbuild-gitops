# resource "google_service_account" "sa" {
#   account_id   = "my-service-account"
#   display_name = "A service account that only Jane can use"
# }

# output "serviceaccountid" {
#   value = google_service_account.sa.id
# }

# resource "google_service_account_iam_binding" "admin-account-iam" {
#   #service_account_id = google_service_account.sa.name
#   service_account_id = google_service_account.sa.id
#   role               = "roles/aiplatform.serviceAgent"

#   members = [
#     #"user:demogcpshop@gmail.com",
#      "serviceAccount:${google_service_account.sa.email}" 
#   ]

#   depends_on = [
#     google_service_account.sa
#   ]
# }
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