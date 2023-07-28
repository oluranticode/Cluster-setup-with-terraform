variable "environment" {
  type    = string
  default = "dev"
}

variable "cluster_name" {
  type    = string
  # default = "product-flw-dev"
}

variable "auto_scaling_enabled" {
  type    = bool
  default = true
}

# ## EKS VPC details
variable "vpc_id" {
  description = "vpc id"
  type = string
}
variable "private_subnets" {
  type = list(string)
}

variable "aws_profile" {
  description = "AWS profile name"
  type        = string
}

variable "aws_account_id" {
  description = "AWS account ID"
  type        = list(string)
}

variable "aws_region" {
  description = "Region"
  type = string
}
