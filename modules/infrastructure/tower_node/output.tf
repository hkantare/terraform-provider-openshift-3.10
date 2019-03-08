#################################################
# Output
#################################################
output "tower_ip_address" {
  value = "${ibm_compute_vm_instance.towernode.*.ipv4_address}"
}

output "tower_private_ip" {
  value = "${ibm_compute_vm_instance.towernode.*.ipv4_address_private}"
}

output "tower_domain" {
  value = "${ibm_compute_vm_instance.towernode.domain}"
}

output "tower_host" {
  value = "${ibm_compute_vm_instance.towernode.*.hostname}"
}

