resource "google_storage_bucket" "test_bucket3246" {
  force_destroy               = false
  location                    = "#${var.region}"
  name                        = "#${var.env}-test_bucket3246"
  project                     = "#${var.project}"
  public_access_prevention    = "enforced"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
}
