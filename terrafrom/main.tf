resource "google_storage_bucket" "Bucket" {
  name = "sps-backend"
  location = "US"
}
data "archive_file" "archi" {
  type = "zip"
  source_dir = "../Functions"
  output_path = "../Functions.zip"

}

resource "google_storage_bucket_object" "archive1" {
  name = "Functions.zip"
  bucket = google_storage_bucket.Bucket.name
  source = data.archive_file.archi.output_path
}



resource "google_cloudfunctions_function" "fucntion" {
  name = "vistitor-count-2"
  runtime = "python310"
  available_memory_mb = 256
  source_archive_bucket = google_storage_bucket.Bucket.name
  source_archive_object = google_storage_bucket_object.archive1.name
  max_instances = 1000
  min_instances = 0
  entry_point = "get_visitor_number"
  trigger_http = true
  region = "us-central1"
}

resource "google_cloudfunctions_function_iam_member" "functioniampolicy" {
  region = "us-central-1"
  cloud_function = google_cloudfunctions_function.fucntion.name
  role = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
