terraform {
  required_version = ">=0.13.1"  
  required_providers {
    aws = ">=3.54.0"
    local = ">=2.1.0"
  }
  backend "s3" {
    #must create the bucket before
    bucket = "course-full-cycle-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "new-vpc" {
    source = "./modules/vpc"
    prefix = var.prefix
    vpc_cidr_block = var.vpc_cidr_block
}

module "eks" {
    source = "./modules/eks"
    prefix = var.prefix
    cluster_name = var.cluster_name
    vpc_id = module.new-vpc.vpc_id
    retention_days = var.retention_days
    subnet_ids = module.new-vpc.subnet_ids
    desired_size = var.desired_size
    max_size = var.max_size
    min_size = var.min_size
}