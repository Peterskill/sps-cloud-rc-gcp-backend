resource "google_storage_bucket" "Bucket" {
  name = "sps-backend"
  location = "US"
}

resource "google_storage_bucket_object" "archive1" {
  name = "requirements.txt"
  bucket = google_storage_bucket.Bucket.name
  source = "../Functions/requirements.txt"
}
resource "google_storage_bucket_object" "archive2" {
  name = "main.py"
  bucket = google_storage_bucket.Bucket.name
  source = "../Functions/main.py"
}


resource "google_cloudfunctions_function" "fucntion" {
  name = "vistitor-count-2"
  runtime = "python310"
  available_memory_mb = 256
  source_archive_bucket = google_storage_bucket.Bucket.name
  source_archive_object = google_storage_bucket_object.archive2.name
  max_instances = 1000
  min_instances = 0
  entry_point = "get_visitor_number"
  trigger_http = false
  region = "us-central1"
}

