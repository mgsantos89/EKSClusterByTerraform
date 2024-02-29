resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.prefixo_projeto}-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      var.subnet_pub_1a,
      var.subnet_pub_1b
    ]
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_attachment
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.prefixo_projeto}-cluster"
    }
  )

}
