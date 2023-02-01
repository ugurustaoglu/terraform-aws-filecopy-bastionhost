
resource "tls_private_key" "ec2-private-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2-pem" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2-private-key.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
      echo "${tls_private_key.ec2-private-key.private_key_pem}" > private-key/ec2-key.pem
    EOT
  }
}