
resource "aws_iam_role" "demo" {
  name = "eks-cluster-demo"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "demo_amazon_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.demo.name
}

# Create the EKS cluster
resource "aws_eks_cluster" "demo" {
  name     = var.eks_name
  version  = "1.17"
  role_arn = aws_iam_role.demo.arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access = true

    subnet_ids = tolist(concat(
      aws_subnet.private[*].id,
      aws_subnet.public[*].id
    ))
  }

  depends_on = [aws_iam_role_policy_attachment.demo_amazon_eks_cluster_policy]
}