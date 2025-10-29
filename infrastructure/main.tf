terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    encrypt = true
    region  = "us-west-1"
  }
}

provider "aws" {
  region = "us-west-1"
}

provider "aws" {
  alias = "use1"

  region = "us-east-1"
}

module "acm" {
  source = "./acm"

  providers = {
    aws = aws.use1
  }
}

module "s3" {
  source = "./s3"

  cloudfront_dist_arn = module.cloudfront.cloudfront_distribution_arn
}

module "lambda" {
  source = "./lambda"

  iam_role              = module.iam.iam_for_lambda
  apigateway_permission = module.apigateway.apigateway_arn
}

module "iam" {
  source = "./iam"

  visitor_count_table = module.dynamodb.visitor_count_table
}

module "dynamodb" {
  source = "./ddb"
}

module "cloudwatch" {
  source = "./cloudwatch"
}

module "apigateway" {
  source = "./apig"

  lambda_function_arn  = module.lambda.visitor_count_lambda_arn
  cloudwatch_role_arn  = module.iam.iam_for_apig
  cloudwatch_log_group = module.cloudwatch.apig_log_group
}

module "cloudfront" {
  source = "./cloudfront"

  s3_domain_name   = module.s3.aws_s3_bucket.bucket_regional_domain_name
  target_origin_id = module.s3.aws_s3_bucket.bucket_regional_domain_name
  acm_certificate  = module.acm.arn
  alias            = module.acm.domain_name
}