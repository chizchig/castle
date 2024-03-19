provider "aws" {
  region                   = "us-east-1"
  # shared_credentials_files = ["~/.aws/credentials"]
  # profile                  = "default"
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
  # shared_credentials_files = ["~/.aws/credentials"]
  # profile = var.profile
}

provider "aws" {
  alias  = "eu-west-1"
  region = "eu-west-1"
  # shared_credentials_files = ["~/.aws/credentials"]
  # profile = var.profile
}

# data "aws_availability_zones" "available" {
#   state = "available"
# }

data "aws_availability_zones" "available" {
  for_each = toset(var.desired_regions)
  filter {
    name   = "region-name"
    values = [each.value]
  }
}
