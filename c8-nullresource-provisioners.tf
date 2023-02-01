resource "null_resource" "name" {
  depends_on = [module.ec2_api, module.vpc]
  count = length(module.ec2_api[*].public_ip)
  # Connection Block for Provisioners to connect to EC2 Instance

  connection {
      agent               = "true"
      bastion_host        = module.ec2_public_bastion_host[0].public_ip
      bastion_user        = "ec2-user"
      bastion_port        = 22
      bastion_private_key = file("private-key/ec2-key.pem")
      user                = "ec2-user"
      private_key         = file("private-key/ec2-key.pem")
      host                = module.ec2_api[count.index].private_ip
    }

  provisioner "file" {
      content     = templatefile("templates/template.conf.tftpl", { ip_addrs = toset(module.ec2_api[*].private_ip) })
      destination = "/tmp/default.conf"
    }

  provisioner "remote-exec" {
    inline = [
      "hostname",
    ]

  }
}
