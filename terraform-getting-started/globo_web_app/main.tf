# PROVIDERS

provider "aws" {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    region     = var.aws_region
}

#DATA

data "aws_ssm_parameter" "amzn2_linux" {
    name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# RESOURCES

## NETWROKING
resource "aws_vpc" "app" {
    cidr_block           = var.cidr_block.aws_vpc
    enable_dns_hostnames = var.enable_dns_hostnames
}

resource "aws_internet_gateway" "app" {
    vpc_id = aws_vpc.app.id
}

resource "aws_subnet" "public_subnet1" {
    cidr_block              = var.cidr_block.aws_subnet
    vpc_id                  = aws_vpc.app.id
    map_public_ip_on_launch = var.map_public_ip_on_launch
}

#ROUTING

resource "aws_route_table" "app" {
    vpc_id = aws_vpc.app.id

    route {
        cidr_block = var.cidr_block.aws_route_table
        gateway_id = aws_internet_gateway.app.id
    }
}

resource "aws_route_table_association" "app_subnet1" {
    subnet_id      = aws_subnet.public_subnet1.id
    route_table_id = aws_route_table.app.id
}

# SECURITY GROUP
# Nginx security group
resource "aws_security_group" "nginx_sg" {
    name   = "nginx_sg"
    vpc_id = aws_vpc.app.id

    # HTTP access from anywhere
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = [var.cidr_block.aws_security_group_ingress]
    }

    #outbound internet access
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = [var.cidr_block.aws_security_group_egress]
    }
  
}

#INSTANCES
resource "aws_instance" "nginx1" {
    ami = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
    instance_type = var.instance_type
    subnet_id = aws_subnet.public_subnet1.id
    vpc_security_group_ids = [aws_security_group.nginx_sg.id]

    user_data = <<EOF
    #! /bin/bash
    sudo amazon-linux-extras install -y nginx1
    sudo service nginx start
    sudo rm /user/share/nginx/html/index.html
    echo '<html><head><title>Taco Team Server</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">You did it! Have a &#127790;</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
    EOF

}