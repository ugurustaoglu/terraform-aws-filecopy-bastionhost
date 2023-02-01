
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  # VPC Basic Details
  name                = var.vpc_name
  cidr                = var.vpc_cidr_block
  azs                 = var.vpc_azs
  public_subnets      = var.vpc_public_subnets
  private_subnets     = var.vpc_private_subnets

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway


  # VPC DNS Parameters
  enable_dns_hostnames  = var.vpc_enable_dns_hostnames
  enable_dns_support    = var.vpc_enable_dns_support

  public_subnet_tags = {
    Type = var.vpc_tag_public_subnets
  }

  private_subnet_tags = {
    Type = var.vpc_tag_private_subnets
  }

  tags = {
    Name = var.app_name
    Environment = local.environment
  }

  vpc_tags = {
    Name = "${var.app_name}-vpc-${local.environment}"
  }
}
