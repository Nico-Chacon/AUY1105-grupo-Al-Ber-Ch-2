variable "region" {
  type    = string
  default = "us-east-1"
}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}

variable "vpc_cidr" {
  type    = string
  default = "10.1.0.0/16"
}

variable "subnet_cidr" {
  type    = string
  default = "10.1.1.0/24"
}

variable "my_ip" {
  type    = string
  default = "191.112.213.33/32"
}

variable "ami_id" {
  type    = string
  default = "ami-123456"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
