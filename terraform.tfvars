environment = "dev"

# AWS - Terraform
region         = "us-east-1a"
aws_region     = "us-east-1"
vpc_cidr_block = "10.0.0.0/16"
vpc_name       = "mlflow-vpc"
vpc_azs        = ["us-east-1a"]
vpc_public_subnets      = ["10.0.101.0/24"]
vpc_tag_public_subnets  = "dummy-api-public-subnets"
vpc_private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_tag_private_subnets = "dummy-api-private-subnets"
# EC2
key_name             = "ec2-key"
