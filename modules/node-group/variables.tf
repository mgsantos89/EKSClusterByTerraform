variable "prefixo_projeto" {
  type        = string
  description = "Prefixo para nome de recursos"
}

variable "tags" {
  type        = map(any)
  description = "Tags Padrão dos Recursos provisionados"
}



variable "cluster_name" {
  type        = string
  description = "Nome do Cluster EKS"

}


variable "subnet_priv_1a" {
  type        = string
  description = "subnet id da zona 1a"

}


variable "subnet_priv_1b" {
  type        = string
  description = "subnet id da zona 1b"

}
