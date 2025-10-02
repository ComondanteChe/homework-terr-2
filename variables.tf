###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "dafault"
  description = "VPC network & subnet name"
}


###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIfVKappDvBQ9kbqze6JrwUpNwdaS9/W8TH47whYi2ls administrator@Educational"
#   description = "ssh-keygen -t ed25519"
# }

# variable "vm_web_cores" {
#   type        = number
#   default     = 2
#   description = "vCPU count"
  
# }

# variable "vm_web_memory" {
#   type        = number
#   default     = 1
#   description = "RAM in GB"
# }

# variable "vm_web_core_fraction" {
#   type        = number
#   default     = 20
#   description = "CPU core fraction"
# }

variable "vm_web_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS image"
  
}

variable "vm_web_platform" {
  type        = string
  default     = "standard-v3"
  description = "VM platform"
  
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM name"
  
}

variable "zone_web" {
  type        = string
  default     = "ru-central1-a"
    
}