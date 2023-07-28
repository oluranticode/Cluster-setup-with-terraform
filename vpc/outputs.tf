output "vpc_id" {
  value = module.eks_vpc.vpc_id
}

output "private_subnets_ids" {
  value = module.eks_vpc.private_subnets
}

output "public_subnets_ids" {
  value = module.eks_vpc.public_subnets
}
