resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.attached_disk.id
  instance = google_compute_instance.vm.id
}

resource "google_compute_instance" "vm" {
  name         = "attached-disk-instance"
  project =  var.project_id
  machine_type = "e2-medium"
  //zone         = "us-central1-a"
 
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }
}

resource "google_compute_disk" "attached_disk" {
  name  = "test-disk"
  project =  var.project_id
  type  = "pd-ssd"
  //zone  = "us-central1-a"
  size = "10"
  labels = {
    environment = "dev"
  }
  
}