resource "null_resource" "setup_tower" {

  connection {
    type     = "ssh"
    user     = "root"
    host = "${var.tower_ip_address}"
    private_key = "${file(var.tower_private_ssh_key)}"
  }
  provisioner "file" {
    source      = "${path.cwd}/scripts"
    destination = "/tmp"
   
  }


    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/scripts/*",
      "/tmp/scripts/rhn_register.sh ${var.rhn_username} ${var.rhn_password} ${var.pool_id}",
    ]
  
    }

}
