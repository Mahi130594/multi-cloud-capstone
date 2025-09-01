provider "aws" {
  region = var.region
}

module "network" {
  source         = "../../modules/network"
  env            = var.env
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  azs            = var.azs
}

module "registry" {
  source = "../../modules/container-registry"
  env    = var.env
}

module "cluster" {
  source     = "../../modules/k8s-cluster"
  env        = var.env
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.public_subnet_ids
}
