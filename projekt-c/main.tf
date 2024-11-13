provider "aws" {
    region = "eu-central-1"
}

resource "aws_instance" "instance_c" {
  ami           = "ami-0eddb4a4e7d846d6f"
  instance_type = "t2.micro"
  tags = {
    Name = "instanceprojectc"
  }
}
data "terraform_remote_state" "projectA" {
  backend = "s3"
  config = {
    bucket = "mein-beispiel-state-bucketa"
    key    = "projectA/terraform.tfstate"
    region = "eu-central-1"
  }
}

resource "aws_security_group" "instanceasceuritygroup" {
  vpc_id = data.terraform_remote_state.projectA.outputs.vpc_id
  name        = "instanceasceuritygroup"
  description = "Allow ssh traffic"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  
}

output "instance_id" {
    value = data.terraform_remote_state.projectA.outputs.instance_id
  
}

output "instance_public_ip" {
  value = data.terraform_remote_state.projectA.outputs.instance_public_ip
}

output "instance_security_group_id" {
  value = aws_security_group.instanceasceuritygroup.id
}