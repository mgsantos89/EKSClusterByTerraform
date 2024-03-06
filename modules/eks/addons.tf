resource "aws_eks_addon" "aws-ebs-csi-driver" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = "aws-ebs-csi-driver"

  tags = merge(
    var.tags,
    {
      Name = "${var.prefixo_projeto}-cluster"
    }
  )
}

