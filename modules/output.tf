output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "igw_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private[*].id
}

output "public_route_table_ids" {
  description = "IDs of the route tables for public subnets"
  value       = aws_route_table.public[*].id
}

output "private_route_table_ids" {
  description = "IDs of the route tables for private subnets"
  value       = aws_route_table.private[*].id
}

output "nat_gateway_ids" {
  description = "IDs of the NAT gateways"
  value       = aws_nat_gateway.nat_gateway[*].id
}

output "security_group_id" {
  description = "ID of the security group allowing TLS inbound traffic"
  value       = aws_security_group.allow_tls.id
}
