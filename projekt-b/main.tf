provider "aws" {
  region = "eu-central-1"
}

data "terraform_remote_state" "projectA" {
  backend = "s3"
  config = {
    bucket = "mein-beispiel-state-bucket"
    key    = "projectA/terraform.tfstate"
    region = "eu-central-1"
  }
}


output "instance_id_from_project_a" {
    value = data.terraform_remote_state.projectA.outputs.instance_id 
}

output "instance_public_ip_from_project_a" {
    value = data.terraform_remote_state.projectA.outputs.instance_public_ip 
}