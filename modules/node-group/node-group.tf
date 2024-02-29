resource "aws_eks_node_group" "eks_managed_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.prefixo_projeto}-node-group"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids = [
    var.subnet_priv_1a,
    var.subnet_priv_1b
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_node_group_role_attachment_cni,
    aws_iam_role_policy_attachment.eks_node_group_role_attachment_ecr,
    aws_iam_role_policy_attachment.eks_node_group_role_attachment_worker
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.prefixo_projeto}-node-group"
    }
  )
}