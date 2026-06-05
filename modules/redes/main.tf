resource "aws_vpc" "AUY1105-duocapp-vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "AUY1105-duocapp-subnet" {
  vpc_id            = aws_vpc.AUY1105-duocapp-vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone
}

resource "aws_security_group" "example" {
  name        = "example-sg"
  description = "SG para instancias EC2"
  vpc_id      = aws_vpc.AUY1105-duocapp-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
    description = "Acceso SSH desde mi IP"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Salida a internet"
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

resource "aws_cloudwatch_log_group" "vpc_logs" {
  name              = "vpc-flow-logs"
  retention_in_days = 7
}

resource "aws_flow_log" "vpc" {
  vpc_id          = aws_vpc.AUY1105-duocapp-vpc.id
  log_destination = aws_cloudwatch_log_group.vpc_logs.arn
  traffic_type    = "ALL"
}

