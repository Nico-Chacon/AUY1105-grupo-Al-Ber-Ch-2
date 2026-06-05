variable "vpc_cidr" {
  description = "CIDR para la VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR para la subred pública"
  type        = string
}

variable "availability_zone" {
  description = "Zona de disponibilidad para la subred"
  type        = string
}

variable "my_ip" {
  description = "IP pública para acceso SSH"
  type        = string
}
