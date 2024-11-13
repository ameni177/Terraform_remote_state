terraform {
  backend "s3" {
    bucket = "mein-beispiel-state-bucket"
    key    = "projectA/terraform.tfstate"
    region = "eu-central-1"
  }
}