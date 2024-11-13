terraform {
  backend "s3" {
    bucket = "mein-beispiel-state-bucketc"
    key    = "projectC/terraform.tfstate"
    region = "eu-central-1"
  }
}