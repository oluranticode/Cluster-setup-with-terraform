terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
 region = var.aws_region
 profile = var.aws_profile
 allowed_account_ids = var.aws_account_id
}

module "eks_vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "5.0.0"
  name                 = var.vpc_name
  cidr                 = var.vpc_cidr
  azs                  = var.vpc_azs
  private_subnets      = var.vpc_private_subnets
  public_subnets       = var.vpc_public_subnets
  enable_nat_gateway   = var.enable_nat_gateway
  enable_dns_hostnames = true

  tags = {
    Terraform   = "true"
    Environment = "${var.environment}"
  }
}
