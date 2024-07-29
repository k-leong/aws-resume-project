terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-1"
}

module "s3" {
  source = "./s3"
}

# module "lambda" {
#   source = "./lambda"

#   iam_role = module.iam.iam_role_arn
# }

# module "iam" {
#   source = "./iam"
# }