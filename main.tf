terraform {
  required_providers {
    google ={
        source = "hashicorp/google"
        version = "4.51.0"
    }
  }
}

provider "google" {
    credentials = file("cloud-resume-challenge-385006-b3ee7096fcb4.json")
    project = "cloud-resume-challenge-385006"
    region = "us-central1"

}


resource "google_cloudfunctions_function" "fucntion" {
  name = "vistitor-count-2"
  runtime = "python310"
  available_memory_mb = 256
  source_archive_bucket = "sps-backend"
  source_archive_object = "main.py"
  entry_point = "get_visitor_number"
  trigger_http = true
  region = "us-central1"
}

