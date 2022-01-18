resource "yandex_compute_instance" "app" {
  name        = "reddit-app-${count.index}"
  count       = var.instance_count
  platform_id = "standard-v1"
  hostname    = "reddit-app-${count.index}"

  connection {
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    ipv6      = false
    nat       = true
  }
}
