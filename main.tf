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

data "archive_file" "zipping" {
  type = "zip"
  source_dir = "gs://sps-backend"
  output_path = "gs://sps-backend/func.zip"
}

resource "google_cloudfunctions2_function" "name" {
  name = "vistitor-count-2"
  location = "us-central1"
  build_config {
    runtime = "python310"
    entry_point = "get_visitor_number"
    source{
        storage_source {
          bucket = "sps-backend"
          object = "fucn.zip"
        }

      }
    }

  service_config {
    min_instance_count = 0
    max_instance_count = 100
    available_memory = "256M"
    timeout_seconds = 60
  }
}

