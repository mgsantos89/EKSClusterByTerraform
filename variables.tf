variable "cidr_block" {
  type        = string
  description = "CIDR de Rede para ser usado na VPC"
}

variable "prefixo_projeto" {
  type        = string
  description = "Prefixo para nome de recursos"


}

variable "region" {
  type        = string
  description = "Região AWS para criação dos Recursos"
}

variable "tags" {
  type        = map(any)
  description = "TAGS padrões a serem incluidas para identificações dos recursos"
}