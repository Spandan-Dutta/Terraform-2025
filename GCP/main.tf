provider "google" {
    credentials = file("gcp-account.json")
    project = "gcp-terraform-462904"
    region = "asia-south1"
    zone = "asia-south1-a"
}

resource "google_compute_instance" "gcp_instance" {
    name = "gcp-instance"
    machine_type = "e2-medium"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }

    network_interface {
        network = "default"
        access_config {
            // Ephemeral IP
        }
    }
}
