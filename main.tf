resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
  route_table_id = yandex_vpc_route_table.rt.id
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  platform_id = var.vm_web_platform
  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = false
  }

  metadata = {
    serial-port-enable = var.vms_ssh_root_key["ssh"].serial-port-enable
    ssh-keys           = "${var.vms_ssh_root_key["ssh"].user}:${var.vms_ssh_root_key["ssh"].ssh-keys}"
  }

}



resource "yandex_vpc_network" "db" {
  name = var.vm_db_vpc_name
}

resource "yandex_vpc_subnet" "db" {
  name = var.vm_db_vpc_name
  zone = var.vm_db_default_zone
  network_id     = yandex_vpc_network.db.id
  v4_cidr_blocks = var.vm_db_default_cidr
}

data "yandex_compute_image" "ubuntu_db" {
  family = var.vm_db_image
}

resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name
  platform_id = var.vm_db_platform
  zone        = var.vm_db_default_zone
  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_db.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db.id
    nat       = false
  }

  metadata = {
    serial-port-enable = var.vms_ssh_root_key["ssh"].serial-port-enable
    ssh-keys           = "${var.vms_ssh_root_key["ssh"].user}:${var.vms_ssh_root_key["ssh"].ssh-keys}"
  }

}