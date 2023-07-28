variable "vpc_name" {
  type        = string
  description = "The name of the VPC."
}
variable "module_version" {
  type    = string
  default = "5.0.0"
}

variable "vpc_region" {
  description = "Name of region"
  type        = string
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "vpc_azs" {
  type        = list(string)
  description = "The availability zones for the VPC e.g ['us-east-1a', 'us-east-1b', 'us-east-1c']."
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "The CIDR blocks for the private subnets e.g ['10.1.120.0/21', '10.1.112.0/21', '10.1.104.0/21']."
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "The CIDR blocks for the public subnets e.g ['10.1.8.0/21', '10.1.16.0/21', '10.1.24.0/21']."
}

variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Whether to enable NAT Gateway."
}

variable "environment" {
  type        = string
  description = "The environment to deploy the infrastructure to."
  default     = "dev"
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

