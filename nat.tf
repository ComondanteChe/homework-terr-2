data "yandex_vpc_network" "net" {
  folder_id = var.folder_id
  name      = "dafault"
}

resource "yandex_vpc_subnet" "subnet" {
  folder_id      = var.folder_id
  name           = "dafault"
  v4_cidr_blocks = ["10.0.1.0/24"]
  zone           = "ru-central1-a"
  network_id     = data.yandex_vpc_network.net.id
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id      = var.folder_id
  name = "test-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  folder_id      = var.folder_id
  name       = "test-route-table"
  network_id = "e9b6ctfsvhq3e8qanatt"

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}
