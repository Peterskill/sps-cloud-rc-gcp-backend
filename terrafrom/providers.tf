terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~>4.51.0"
    }
    archive ={
        source = "hashicorp/archive"
        version = "~>2.3.0"
    }
  }
}

provider "google" {

    project = "sps-cloud-rc"
    region = "us-central1"
}