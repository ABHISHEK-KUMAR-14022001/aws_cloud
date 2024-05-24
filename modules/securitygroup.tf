# Adding security group
resource "aws_security_group" "allow_tls" {
  name_prefix = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  # If security_group_cidr_blocks is not needed, remove this block
  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # cidr_blocks = var.security_group_cidr_blocks
    cidr_blocks = ["0.0.0.0/0"] # Example CIDR block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}