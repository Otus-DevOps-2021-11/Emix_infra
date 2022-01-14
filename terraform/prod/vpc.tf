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
