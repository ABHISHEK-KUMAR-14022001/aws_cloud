# Route Table for public subnets
resource "aws_route_table" "public" {
  count  = length(var.public_subnet_cidrs)
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = "public-route-table-${count.index + 1}"
    Description = "Route table for public subnet ${count.index + 1}"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}


# Associate route tables with public subnets
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_cidrs)
  depends_on     = [aws_subnet.public, aws_route_table.public]
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[count.index].id
}



# Route Table for private subnets
resource "aws_route_table" "private" {
  count      = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.vpc.id

  tags = {
    Name        = "private-route-table-${count.index + 1}"
    Description = "Route table for private subnet ${count.index + 1}"
  }

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
  }
}


# Route Table Association for private subnets
resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnet_cidrs)
  depends_on     = [aws_subnet.private, aws_route_table.private]
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private[count.index].id  # Fix applied here
}
