output "VM" {
  value = {
    instance_name_db = yandex_compute_instance.platform_db.name
    external_ip_db = resource.yandex_compute_instance.platform_db.network_interface.0.nat_ip_address
    fqdn_db = resource.yandex_compute_instance.platform_db.fqdn
    instance_name_web = resource.yandex_compute_instance.platform.name
    external_ip_web = resource.yandex_compute_instance.platform.network_interface.0.nat_ip_address
    fqdn_web = resource.yandex_compute_instance.platform.fqdn
  }
}