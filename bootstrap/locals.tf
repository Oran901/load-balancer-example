locals {
  # Calculate number of AZs in the region
  az_count = min(3, length(data.aws_availability_zones.available.names))

  # Generate CIDR blocks for public subnets
  public_subnets = [
    for az_index in range(local.az_count) :
    cidrsubnet(local.vpc_cidr, 8, az_index)
  ]

  # Generate CIDR blocks for private subnets
  private_subnets = [
    for az_index in range(local.az_count) :
    cidrsubnet(local.vpc_cidr, 8, az_index + local.az_count)
  ]

  # Map AZs to their names
  azs = data.aws_availability_zones.available.names

  # security group inbound rules


  ########## variables ###############
  instance_type     = "t3.medium"
  project           = "lb-example"
  vpc_cidr          = "192.168.0.0/16"
  region            = "us-east-1"
  domain_name       = "oyad.store"
}

data "aws_availability_zones" "available" {
  state = "available"
}

