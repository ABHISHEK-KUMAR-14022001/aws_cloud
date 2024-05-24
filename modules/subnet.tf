resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.public_subnet_availability_zones[count.index]

  tags = {
    Name                        = "Subnet-Public : Public Subnet ${count.index + 1}"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.private_subnet_availability_zones[count.index]

  tags = {
    Name                        = "Subnet-Private : Private Subnet ${count.index + 1}"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}
