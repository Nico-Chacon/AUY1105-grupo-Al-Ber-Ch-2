resource "aws_instance" "duocapp" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.example.id]

  monitoring = true   # Activa detailed monitoring

  metadata_options {
    http_tokens = "required"   # Forzar IMDSv2
  }

  associate_public_ip_address = false  # Quita IP pública si no es necesaria
}

