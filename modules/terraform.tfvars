#region 
region = "us-east-1"

# VPC variables
vpc_cidr_block = "10.0.0.0/16"
vpc_name       = "MyVPC"

#for subnet
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
public_subnet_availability_zones = ["us-east-1a", "us-east-1b"]
private_subnet_availability_zones = ["us-east-1a", "us-east-1b"]



# Internet Gateway variables
igw_name = "MyInternetGateway"

eks_name = "my-eks-cluster"

worker_node_count = 1




