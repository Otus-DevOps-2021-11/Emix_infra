provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

resource "yandex_vpc_network" "app-network" {
  name        = "App network"
  description = "Newtwork for app by Terraform"
  folder_id   = var.folder_id
  labels = {
    name = "otus"
  }
}

resource "yandex_vpc_subnet" "app-subnet" {
  name           = "App subnet for app by Terraform"
  v4_cidr_blocks = ["192.168.0.0/16"]
  zone           = var.zone
  network_id     = yandex_vpc_network.app-network.id
}

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
      image_id = var.image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.app-subnet.id
    ipv6      = false
    nat       = true
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}
