

# Define Elastic IPs for each NAT Gateway
resource "aws_eip" "nat_eip" {
  count = length(var.public_subnet_cidrs)
  vpc   = true

  tags = {
    Name = "NAT EIP ${count.index + 1}"
  }
}


# Create NAT Gateways in the public subnets
resource "aws_nat_gateway" "nat_gateway" {
  count         = length(var.public_subnet_cidrs)
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
    Name = "NAT Gateway ${count.index + 1}"
  }

  depends_on = [aws_internet_gateway.igw]
}