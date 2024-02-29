resource "aws_iam_policy" "eks_controller_policy" {
  name = "${var.prefixo_projeto}-aws-load-balancer-controller"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = file("${path.module}/iam_policy.json")

  tags = merge(
    var.tags,
    {
      Name = "${var.prefixo_projeto}-controller-policy"
    }
  )

}