output "oidc" {
  value = module.eks_cluster.oidc
}

output "certificate_authority" {
  value = module.eks_cluster.certificate_authority
}

output "endpoint" {
  value = module.eks_cluster.endpoint
}