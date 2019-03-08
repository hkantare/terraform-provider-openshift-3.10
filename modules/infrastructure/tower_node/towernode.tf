#################################################
# VM Instance Setup for Tower node
#################################################
resource "ibm_compute_vm_instance" "towernode" {
  os_reference_code         = "${var.tower_os_ref_code}"
  hostname                  = "${var.tower_hostname_prefix}-${var.random_id}-${var.tower_hostname}"
  domain                    = "${var.domain}"
  datacenter                = "${var.datacenter}"
  private_network_only      = "false"
  flavor_key_name           = "${var.tower_flavor}"
  network_speed             = 1000
  local_disk                = "false"
  ssh_key_ids               = ["${var.tower_ssh_key_ids}"]
  private_vlan_id           = "${var.private_vlan_id}"
  public_vlan_id            = "${var.public_vlan_id}"
  public_security_group_ids = ["${var.tower_node_sg}"]
  private_security_group_ids = ["${var.tower_node_sg}"]
  hourly_billing            = "${var.hourly_billing}"
}



#################################################
# OS Setup
#################################################

resource "null_resource" "iscsi_towernode" {
  connection {
    type     = "ssh"
    user     = "root"
    host     = "${ibm_compute_vm_instance.towernode.ipv4_address}"
    private_key = "${file(var.tower_private_ssh_key)}"
  }

  provisioner "remote-exec" {
  inline = [
    "timedatectl set-timezone UTC",
    "yum install device-mapper-multipath iscsi-initiator-utils lvm2 -y",
    "sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config",
    "fixfiles restore /",
    "setenforce 1",
           ]
  }

}

