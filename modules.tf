module "eks_network" {
  source          = "./modules/network"
  cidr_block      = var.cidr_block
  prefixo_projeto = var.prefixo_projeto
  tags            = local.tags
}

module "eks_cluster" {
  source          = "./modules/eks"
  prefixo_projeto = var.prefixo_projeto
  tags            = local.tags
}