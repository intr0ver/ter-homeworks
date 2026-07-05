output "vm_netology" {
  value = {
    vm_web = {
      fqdn = yandex_compute_instance.platform.fqdn
      external_ip = yandex_compute_instance.platform.network_interface.0.nat_ip_address
      instance_name = yandex_compute_instance.platform.name
    }
    vm_db = {
      fqdn = yandex_compute_instance.platform_db.fqdn
      external_ip = yandex_compute_instance.platform_db.network_interface.0.nat_ip_address
      instance_name = yandex_compute_instance.platform_db.name
      
    }
  }
}