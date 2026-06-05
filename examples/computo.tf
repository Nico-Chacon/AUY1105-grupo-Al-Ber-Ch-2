provider "aws" {
  region = "us-east-1"
}

module "computo" {
  source        = "../modules/computo"
  ami_id        = "ami-05cf1e9f73fbad2e2"
  instance_type = "t2.micro"
  subnet_id     = "subnet-1234567890abcdef"
  sg_id         = "sg-1234567890abcdef"
  key_name      = "labsuser"
}

output "instance_id" {
  value = module.computo.instance_id
}

output "instance_public_ip" {
  value = module.computo.instance_public_ip
}
