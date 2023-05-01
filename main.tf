terraform {
  required_providers {
    google ={
        source = "hashicorp/google"
        version = "4.51.0"
    }
  }
}

provider "google" {
    credentials = file("cloud-resume-challenge-385006-66396fab8806.json")
    project = "cloud-resume-challenge-385006"
    region = ""

}


resource "google_cloudfunctions_function" "name" {
  name = "vistitor-count-2"
  runtime = "python310"
  entry_point = "get_visitor_number"
  trigger_http = true
  available_memory_mb= "256"
  min_instances = 0
  max_instances = 100
  timeout = 60
  source_repository {
    url = "https://source.cloud.google.com/cloud-resume-challenge-385006/github_peterskill_sps-cloud-rc-gcp-backend"
  }

}