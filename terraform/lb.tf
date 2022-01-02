resource "yandex_lb_network_load_balancer" "app-lb" {
  name = "balancer1"

  listener {
    name = "applistener"
    port = 9292
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.app-tg.id

    healthcheck {
      name = "http"
      http_options {
        port = 9292
        path = "/"
      }
    }
  }
}

resource "yandex_lb_target_group" "app-tg" {
  name      = "app-target-group"
  region_id = var.zone_id

  dynamic "target" {
    for_each = yandex_compute_instance.app[*].network_interface.0.ip_address
    content {
      subnet_id = yandex_vpc_subnet.app-subnet.id
      address   = target.value
    }
  }
}
