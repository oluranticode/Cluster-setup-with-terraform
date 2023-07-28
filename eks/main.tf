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

locals {
  cluster_name = "product-flw-dev"
}
data "aws_eks_cluster" "eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  # version         = "17.20.0"
  version         = "17.10.0"
  cluster_version = "1.26"
  cluster_name    = local.cluster_name
  vpc_id          = var.vpc_id
  subnets         = var.private_subnets
  manage_aws_auth = true

  node_groups = {
    node-group-1 = {
      name                   = "product-cluster-node"
      desired_capacity       = 1
      max_capacity           = 5
      min_capacity           = 1
      instance_types         = ["m6in.large"]
      capacity_type          = "ON_DEMAND"
      create_launch_template = true
      additional_tags = {
        "Environment"                                     = "dev"
        "Terraform"                                       = "true"
        "k8s.io/cluster-autoscaler/${local.cluster_name}" = "owned"
        "k8s.io/cluster-autoscaler/enabled "              = "true"
      }
    }
  }

}
resource "aws_eks_addon" "kube-proxy" {
  cluster_name      = local.cluster_name
  addon_name        = "kube-proxy"
  resolve_conflicts = "OVERWRITE"
}
resource "aws_eks_addon" "vpc-cni" {
  cluster_name      = local.cluster_name
  addon_name        = "vpc-cni"
  resolve_conflicts = "OVERWRITE"
}
resource "aws_eks_addon" "coredns" {
  cluster_name      = local.cluster_name
  addon_name        = "coredns"
  resolve_conflicts = "OVERWRITE"
}
