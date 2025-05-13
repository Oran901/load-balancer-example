module "eks-infra" {
  source = "../modules/eks-infra"

  vpc_cidr          = local.vpc_cidr
  az_count          = local.az_count
  public_subnets    = local.public_subnets
  private_subnets   = local.private_subnets
  azs               = local.azs
  instance_type     = local.instance_type
  project           = local.project
  region            = local.region
}

module "l4" {
  source = "../modules/l4"
  
  project           = local.project
  domain_name = local.domain_name

  depends_on = [ module.eks-infra ]
}