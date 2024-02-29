variable "prefixo_projeto" {
  type        = string
  description = "Prefixo para nome de recursos"
}

variable "tags" {
  type        = map(any)
  description = "Tags Padrão dos Recursos provisionados"
}

variable "subnet_pub_1a" {
  type        = string
  description = "Subnet public do cluster EKS"

}

variable "subnet_pub_1b" {
  type        = string
  description = "Subnet public do cluster EKS"

}