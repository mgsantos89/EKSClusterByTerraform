variable "prefixo_projeto" {
  type        = string
  description = "Prefixo para nome de recursos"
}

variable "tags" {
  type        = map(any)
  description = "Tags Padrão dos Recursos provisionados"
}
