terraform {
  backend "remote" {
    organization = "the_hub"
    workspaces {
      name = "castle"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.35.0"
    }
    # skip_credentials_validation = true
  }
}