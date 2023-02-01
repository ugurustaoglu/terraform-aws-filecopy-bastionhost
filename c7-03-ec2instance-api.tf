# AWS EC2 Instance Terraform Module
# Bastion Host - EC2 Instance that will be created in VPC Public Subnet

module "ec2_api" {
  depends_on = [aws_key_pair.ec2-pem]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"
  count = length(module.vpc.private_subnets)

  # insert the 10 required variables here
  name                   = "${var.environment}-API-${count.index}"
  #instance_count         = 5
  #ami                    = data.aws_ami.dummy_service.id
  ami                    = data.aws_ami.amz_linux.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  #monitoring             = true
  subnet_id =  module.vpc.private_subnets[count.index]
  vpc_security_group_ids = [module.sg_private_api.this_security_group_id]
  # user_data = local.user_data
  tags = local.common_tags
}