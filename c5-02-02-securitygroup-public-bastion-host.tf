# AWS EC2 Security Group Terraform Module
# Security Group for Public Bastion Host
module "sg_public_bastion_host" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"

  name = "public-bastion-host-sg"
  description = "Security Group with SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules = var.sg_bastion_host_ingress_rules
  ingress_cidr_blocks = var.sg_bastion_host_ingress_cidr_blocks

  # Egress Rule - all-all open
  egress_rules = var.sg_bastion_host_egress_rules
  tags = local.common_tags
}