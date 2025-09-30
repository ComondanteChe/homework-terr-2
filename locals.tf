locals {
    vm_db_name  = "${var.vm_db_name}-${var.vm_db_default_zone}"
    vm_web_name = "${var.vm_web_name}-${var.default_zone}"
}