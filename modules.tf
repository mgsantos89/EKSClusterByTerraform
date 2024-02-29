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
  subnet_pub_1a   = module.eks_network.subnet_pub_1a
  subnet_pub_1b   = module.eks_network.subnet_pub_1b
}

module "eks_node_group" {
  source          = "./modules/node-group"
  prefixo_projeto = var.prefixo_projeto
  tags            = local.tags

}