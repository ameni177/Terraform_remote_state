terraform {
  backend "s3" {
    bucket = "mein-beispiel-state-bucketa"
    key    = "projectA/terraform.tfstate"
    region = "eu-central-1"
  }
}