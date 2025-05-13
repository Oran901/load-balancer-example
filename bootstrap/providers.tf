provider "aws" {
  region = local.region
  assume_role {
    role_arn     = "arn:aws:sts::767397954823:role/_localadmin_tf_role"
    session_name = "TerraformSession"
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks-infra.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks-infra.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.eks_auth.token
  }
}

data "aws_eks_cluster_auth" "eks_auth" {
  name = module.eks-infra.cluster_name
}

terraform {
  backend "s3" {
    bucket         = "terraform-state-example-lb"    # Replace with your S3 bucket name
    key            = "terraform/state.tfstate" # Path to the state file in the bucket
    region         = "us-east-1"               # AWS region of the S3 bucket
    encrypt        = true                      # Encrypt state file at rest
    use_lockfile = true                        # State lock within the S3 bucket
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.81"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.17.0" 
    }
  }

}