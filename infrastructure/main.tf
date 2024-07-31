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

module "lambda" {
  source = "./lambda"

  iam_role = module.iam.iam_for_lambda
}

module "iam" {
  source = "./iam"

  visitor_count_table = module.dynamodb.visitor_count_table
}

module "dynamodb" {
  source = "./ddb"
}