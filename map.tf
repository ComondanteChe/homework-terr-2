variable "vms_resources" {
  type        = map(object({
    cores         = number
    memory        = number
    core_fraction = number
  }))
  default     = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
  }
    description = "All resources"   
}

variable "vms_ssh_root_key" {
    type = map(object({
        serial-port-enable = number
        ssh-keys           = string
        user              = string
            }))
    default = {
        ssh = {
            serial-port-enable = 1
            ssh-keys           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIfVKappDvBQ9kbqze6JrwUpNwdaS9/W8TH47whYi2ls administrator@Educational"
            user              = "ubuntu"
        }
    }
}