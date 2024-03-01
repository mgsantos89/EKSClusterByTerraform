terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.38.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.26.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }
  #Exemplo
  #backend "s3" {
  #  bucket = "devops-storage"
  #  key    = "EKS-tools/terraform.tfstate"
  #  region = "us-east-1"
  #}

  backend "s3" {
    bucket = ""
    key    = ""
    region = ""
  }


}

provider "aws" {
  region = var.region
}

provider "kubernetes" {
  host                   = module.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(module.eks_cluster.certificate_authority)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", module.eks_cluster.cluster_name]
    command     = "aws"
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks_cluster.endpoint
    cluster_ca_certificate = base64decode(module.eks_cluster.certificate_authority)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", module.eks_cluster.cluster_name]
      command     = "aws"
    }
  }
}