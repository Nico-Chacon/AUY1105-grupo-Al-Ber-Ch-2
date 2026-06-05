resource "aws_vpc" "AUY1105-duocapp-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "AUY1105-duocapp-subnet" {
  vpc_id                  = aws_vpc.AUY1105-duocapp-vpc.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_security_group" "example" {
  name        = var.sg_name
  description = "SG para instancias EC2"
  vpc_id      = aws_vpc.AUY1105-duocapp-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
    description = "Acceso SSH desde rango permitido"
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Salida HTTPS"
  }

  tags = {
    Name = var.sg_name
  }
}
