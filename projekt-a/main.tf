provider "aws" {
  region = "eu-central-1"
  
}

resource "aws_instance" "meineErsteInstanz" {
  ami           = "ami-0eddb4a4e7d846d6f"
  instance_type = "t2.micro"
  tags = {
    Name = "dasisteingeänderterName1"
  }
}
data "aws_subnet" "instance_subnet" {
  id = aws_instance.meineErsteInstanz.subnet_id
}

output "instance_id" {
    value = aws_instance.meineErsteInstanz.id
  
}

output "instance_public_ip" {
  value = aws_instance.meineErsteInstanz.public_ip
}

output "vpc_id" {
  value = data.aws_subnet.instance_subnet.vpc_id
}