variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "default-db"
  description = "VPC network & subnet name"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "vCPU count"
  
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "RAM in GB"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "CPU core fraction"
}

variable "vm_db_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS image"
  
}

variable "vm_db_platform" {
  type        = string
  default     = "standard-v3"
  description = "VM platform"
  
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM name"
  
}