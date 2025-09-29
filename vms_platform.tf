# variable "vm_db_cloud_id" {
#   type        = string
#   description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
# }

# variable "vm_db_folder_id" {
#   type        = string
#   description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
# }

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
  default     = "netology-develop-platform-db"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIfVKappDvBQ9kbqze6JrwUpNwdaS9/W8TH47whYi2ls administrator@Educational"
  description = "ssh-keygen -t ed25519"
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