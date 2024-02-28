terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.38.0"
    }
  }
    backend "s3" {
      bucket = "mgsantos-terraform-states"
      key = "EKS-Cluster/terraform.tfstate"
      region = "us-east-1"
    }
}

provider "aws" {
  region = "us-east-1"
}