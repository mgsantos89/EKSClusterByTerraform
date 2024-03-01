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
  cluster_name    = module.eks_cluster.cluster_name
  subnet_priv_1a  = module.eks_network.subnet_priv_1a
  subnet_priv_1b  = module.eks_network.subnet_priv_1b

}

module "eks_aws_load_balancer_controller" {
  source          = "./modules/aws-load-balancer-controller"
  prefixo_projeto = var.prefixo_projeto
  tags            = local.tags
  oidc            = module.eks_cluster.oidc
  cluster_name    = module.eks_cluster.cluster_name
}