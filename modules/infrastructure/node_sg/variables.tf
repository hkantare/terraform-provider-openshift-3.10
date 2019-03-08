#Variable
variable "random_id" {}

//variable "openshift_gateway_public_address" {}

variable "node_sg_name" {
  default     = "ose_node_sg"
  description = "Name of the security group"
}

variable "node_sg_description" {
  default     = "node security grp for vms"
  description = "Description of the security group"
}