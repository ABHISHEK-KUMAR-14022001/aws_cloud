terraform {
  backend "s3" {
    bucket = "terraform-state-backup-11"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}