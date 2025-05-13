terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.17" 
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.81"
    }
  }
  required_version = ">= 0.13"
}