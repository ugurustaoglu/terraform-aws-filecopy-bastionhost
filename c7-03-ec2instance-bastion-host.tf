# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet

module "ec2_public_bastion_host" {
  depends_on = [aws_key_pair.ec2-pem]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"
  count = length(module.vpc.public_subnets)
  # insert the 10 required variables here
  name                   = "${var.environment}-Bastion-Host"
  #instance_count         = 5
  ami                    = data.aws_ami.amz_linux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  #monitoring             = true
  subnet_id              = module.vpc.public_subnets[count.index]
  vpc_security_group_ids = [module.sg_public_bastion_host.this_security_group_id]
  tags = local.common_tags
}