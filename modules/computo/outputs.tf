output "instance_id" {
  description = "ID de la instancia EC2"
  value       = aws_instance.AUY1105-duocapp-ec2.id
}

output "instance_ip" {
  description = "IP pública de la instancia EC2"
  value       = aws_instance.AUY1105-duocapp-ec2.public_ip
}


