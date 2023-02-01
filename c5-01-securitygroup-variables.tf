# Security Group Variables
variable "sg_bastion_host_ingress_rules" {type=list}
variable "sg_bastion_host_ingress_cidr_blocks" {type=list}
variable "sg_bastion_host_egress_rules" {type=list}

variable "sg_api_ingress_rules" {type=list}
variable "sg_api_ingress_cidr_blocks" {type=list}
variable "sg_api_egress_rules" {type=list}
