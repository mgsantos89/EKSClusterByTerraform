variable "prefixo_projeto" {
  type        = string
  description = "Prefixo para nome de recursos"
}

variable "tags" {
  type        = map(any)
  description = "Tags Padrão dos Recursos provisionados"
}

variable "oidc" {
  type        = string
  description = "url HTTPS para OIDC provider do cluster"
}

variable "cluster_name" {
  type        = string
  description = "nome do Cluster EKS"
}