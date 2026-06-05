
provider "aws" {
  region = var.region
}

module "redes" {
  source            = "../modules/redes"
  vpc_cidr          = var.vpc_cidr
  subnet_cidr       = var.subnet_cidr
  availability_zone = var.availability_zone
  my_ip             = "191.112.213.33/32"
}

module "computo" {
  source        = "../modules/computo"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.redes.subnet_id
  sg_id         = module.redes.sg_id
  key_name      = "ec2-key-1"
}

resource "aws_vpc" "AUY1105-duocapp-vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "AUY1105-duocapp-subnet" {
  vpc_id            = aws_vpc.AUY1105-duocapp-vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
}

resource "aws_security_group" "AUY1105-duocapp-sg" {
  vpc_id      = aws_vpc.AUY1105-duocapp-vpc.id
  name        = "AUY1105-duocapp-sg"
  description = "Permite solo acceso SSH desde mi IP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.AUY1105-duocapp-vpc.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.AUY1105-duocapp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.AUY1105-duocapp-subnet.id
  route_table_id = aws_route_table.rt.id
}

