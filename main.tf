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


resource "google_cloudfunctions2_function" "name" {
  name = "vistitor-count"
  location = "us-central-1"
  build_config {
    runtime = "python310"
    entry_point = "get_visitor_number"
    source{
        repo_source{
        project_id = "cloud-resume-challenge-385006"
        repo_name = "Peterskill-sps-cloud-rc-gcp-backend"
        dir = "./Functions"
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