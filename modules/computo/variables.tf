variable "ami_id" {
  description = "AMI de la instancia EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "subnet_id" {
  description = "ID de la subred donde se desplegará la instancia"
  type        = string
}

variable "sg_id" {
  description = "ID del Security Group asociado a la instancia"
  type        = string
}

variable "key_name" {
  description = "Nombre del Key Pair de AWS para acceso SSH"
  type        = string
}
