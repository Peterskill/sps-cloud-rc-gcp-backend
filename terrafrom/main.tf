terraform {
  required_providers {
    google ={
        source = "hashicorp/google"
        version = "4.51.0"
    }
  }
}



data "" "name" {

}
resource "google_cloudfunctions_function" "fucntion" {
  name = "vistitor-count-2"
  runtime = "python310"
  available_memory_mb = 256
  source_archive_bucket = "sps-backend"
  source_archive_object = "main.py"
  max_instances = 1000
  min_instances = 0
  entry_point = "get_visitor_number"
  trigger_http = true
  region = "us-central1"
}

