provider "aws" {
  region = var.aws_region
}

# 1. VPC Module
module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidr_a = "10.0.1.0/24"
  availability_zone_a  = "${var.aws_region}a"
}

# 2. Compute Module (Jenkins Master & Agent)
module "compute" {
  source           = "./modules/compute"
  ami_id           = var.ami_id
  instance_type    = "t3.medium" # Recommended minimum size for running Jenkins smoothly
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_id
}