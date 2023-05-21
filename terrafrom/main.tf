resource "google_storage_bucket" "Bucket" {
  name = "sps-backend"
  location = "US"
}


resource "google_storage_bucket_object" "archive" {
  name = "main.zip"
  bucket = google_storage_bucket.Bucket.name
  source = "../Functions.zip"
}


resource "google_cloudfunctions_function" "fucntion" {
  name = "vistitor-count-2"
  runtime = "python310"
  available_memory_mb = 256
  source_archive_bucket = google_storage_bucket.Bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  max_instances = 1000
  min_instances = 0
  entry_point = "get_visitor_number"
  trigger_http = true
  region = "us-central1"
}

