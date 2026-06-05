resource "aws_instance" "duocapp" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  ebs_optimized = true
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = var.instance_name
  }
  root_block_device {
  encrypted = true
  }
}

