resource "aws_iam_role" "eks_autoscaler_role" {
  name = "eks-cluster-autoscaler-role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        },
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "eks_autoscaler_policy_attachment" {
  name       = "eks-cluster-autoscaler-policy-attachment"
  roles      = [aws_iam_role.eks_autoscaler_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterAutoscalerPolicy"
}
