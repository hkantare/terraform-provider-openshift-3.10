#################################################
# Common Variables
#################################################
variable "random_id" {}
variable "datacenter" {}
variable "domain" {}
variable "private_vlan_id" {}
variable "public_vlan_id" {}
variable "hourly_billing" {}

#################################################
# Tower node Variables
#################################################
variable "tower_hostname" {  
  default = "tower"
}
variable "tower_hostname_prefix" {
  default = "CMR"
}
variable "tower_flavor" {}
variable "tower_os_ref_code" {
  default = "REDHAT_7_64"
}
variable "tower_node_sg"{}
variable "tower_ssh_key_ids" {
  type = "list"
}
variable "tower_private_ssh_key" {}
