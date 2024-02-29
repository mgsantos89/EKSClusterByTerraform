variable "cidr_block" {
  type        = string
  description = "CIDR de Rede para ser usado na VPC"
}

variable "prefixo_projeto" {
  type        = string
  description = "Prefixo para nome de recursos"
}

variable "tags" {
  type        = map(any)
  description = "Tags Padrão dos Recursos provisionados"
}