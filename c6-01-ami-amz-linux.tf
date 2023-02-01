# Get latest AMI ID for Amazon Linux2 OS
data "aws_ami" "amz_linux" {
    most_recent = true
    filter {
        name   = "name"
        values = ["amzn2-ami-*-gp2"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    filter {
        name = "architecture"
        values = ["x86_64"]
    }
    filter {
        name = "root-device-type"
        values = ["ebs"]
    }
    owners = ["amazon"]
}
