/*terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}
*/

/*

terraform {
  required_version = ">= 0.13"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.22.0"
    }
  }
}


provider "google" {
  credentials = file("C:/Users/Bisuchinu/hello-world/multi-vm-creation/key.json")

  project = "wise-ally-348408"
  region  = "us-central"
  zone    = "us-central1-a"
}

provider "google-beta" {
  credentials = file("C:/Users/Bisuchinu/hello-world/multi-vm-creation/key.json")
  project     = "wise-ally-348408"
  region      = "us-central1"
}
*/

provider "google" {
  project = "core-photon-372612"
  region  = "us-central1"
  zone    = "us-central1-c"
}

terraform {
  backend "gcs" {
   // bucket  = "tf-state-prod"
   // prefix  = "terraform/state"
  }
}