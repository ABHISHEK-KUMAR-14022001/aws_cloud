##############   FOR REGION###############
variable "region" {
  description = "The AWS region to deploy resources to."
  type        = string
}

#########    FOR VPC   #########

variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC"
}

###########  FOR SUBNET  #############
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for the public subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "CIDR blocks for the private subnets"
}

variable "public_subnet_availability_zones" {
  type        = list(string)
  description = "Availability zones for the public subnets"
}

variable "private_subnet_availability_zones" {
  type        = list(string)
  description = "Availability zones for the private subnets"
}


###############   FOR INTERNET GATEWAY   ################

variable "igw_name" {
  type        = string
  description = "Name tag for the Internet Gateway"
}

################## FOR EKS CLUSTER NAME #######################

variable "eks_name" {
  description = "Name of the EKS cluster"
  type        = string
}



####################  NODE GROUP  #####################


variable "worker_node_count" {
  type        = number
  description = "Number of worker nodes to create"
}


