module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "${var.project}-${var.region}-eks"
  cluster_version = "1.31"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa                              = true
  enable_cluster_creator_admin_permissions = true

  eks_managed_node_group_defaults = {
    disk_size = 50
  }

  cluster_addons = {
    coredns    = {}
    kube-proxy = {}
  }


  eks_managed_node_groups = {
    example = {
      desired_size = 2
      min_size     = 1
      max_size     = 5

      instance_type = [var.instance_type]
      capacity_type = "ON_DEMAND"
    }


  }
}
