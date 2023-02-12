provider "google" {
  project = "core-photon-372612"
  region  = "us-central1"
  zone    = "us-central1-c"
}

terraform {
  backend "gcs" {
  }
}
