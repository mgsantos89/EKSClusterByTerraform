<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.38.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.eks_managed_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks_node_group_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_node_group_role_attachment_cni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_node_group_role_attachment_ecr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_node_group_role_attachment_worker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do Cluster EKS | `string` | n/a | yes |
| <a name="input_prefixo_projeto"></a> [prefixo\_projeto](#input\_prefixo\_projeto) | Prefixo para nome de recursos | `string` | n/a | yes |
| <a name="input_subnet_priv_1a"></a> [subnet\_priv\_1a](#input\_subnet\_priv\_1a) | subnet id da zona 1a | `string` | n/a | yes |
| <a name="input_subnet_priv_1b"></a> [subnet\_priv\_1b](#input\_subnet\_priv\_1b) | subnet id da zona 1b | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags Padrão dos Recursos provisionados | `map(any)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->