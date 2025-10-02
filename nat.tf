data "yandex_vpc_network" "net_web" {
  folder_id = var.folder_id
  name      = "dafault"
}

data "yandex_vpc_network" "net_db" {
  folder_id = var.folder_id
  name      = "default-db"
  
}

resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id      = var.folder_id
  name = "gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt_web" {
    folder_id      = var.folder_id
    name       = "route-table_web"
    network_id = data.yandex_vpc_network.net_web.id
  
  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}

resource "yandex_vpc_route_table" "rt_db" {
    folder_id      = var.folder_id
    name       = "route-table_db"
    network_id = data.yandex_vpc_network.net_db.id
  
  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}

# data "yandex_vpc_network" "net_db" {
#   folder_id = var.folder_id
#   name      = "default-db"
# }

# resource "yandex_vpc_gateway" "nat_gateway_db" {
#   folder_id      = var.folder_id
#   name = "gateway_db"
#   shared_egress_gateway {}
# }

# resource "yandex_vpc_route_table" "rt_db" {
#   folder_id      = var.folder_id
#   name       = "route-table_db"
#   network_id = data.yandex_vpc_network.net_db.id

#   static_route {
#     destination_prefix = "0.0.0.0/0"
#     gateway_id         = yandex_vpc_gateway.nat_gateway_db.id
#   }
# }
