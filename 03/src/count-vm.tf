resource "yandex_compute_instance" "web" {
  count = 2
  name  = "web-${count.index + 1}"  
  zone  = var.default_zone
  platform_id = "standard-v3"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

   boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 10
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = false
    security_group_ids = [yandex_vpc_security_group.example.id]  
  }

  metadata = {
    serial-port-enable = "1"
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }

  scheduling_policy {
    preemptible = true
  }

  depends_on = [yandex_compute_instance.db]
}