variable "aws_access_key" {
    type        = string
    description = "AWS Access Key"
    sensitive   = true
}

variable "aws_secret_key" {
    type        = string
    description = "AWS Secret Key"
    sensitive   = true
}

variable "aws_region" {
    type        = string
    description = "AWS region to use for resources"
    default     = "us-east-1"
}

variable "enable_dns_hostnames" {
    type        = bool
    description = "Enable DNS hostnames in VPC"
    default     = true
}

variable "map_public_ip_on_launch" {
    type        = bool
    description = "Map a public IP address for Subnet instances"
    default     = true
}

variable "cidr_block" {
  type    = map(string)
  default = {
    "aws_vpc" = "10.0.0.0/16"
    "aws_subnet" = "10.0.0.0/24"
    "aws_route_table" = "0.0.0.0/0"
    "aws_security_group_ingress" = "0.0.0.0/0"
    "aws_security_group_egress" = "0.0.0.0/0"
  }
}

variable "instance_type" {
    type        = string
    description = "Type for EC2 instance"
    default     = "t2.micro"
}