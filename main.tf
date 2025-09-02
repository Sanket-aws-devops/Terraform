provider "aws" {
  region = "us-east-1"
}

module "my_ec2" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
}

module "vpc" {
  source    = "./modules/vpc"
  aws_vpc_cidr = var.aws_vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  allowed_http_cidr = var.allowed_http_cidr
}

module "sg" {
  source = "./modules/sg"
  allowed_http_cidr = var.allowed_http_cidr
  allowed_ssh_cidr = var.allowed_http_cidr
  vpc_id           = module.vpc.vpc_id
}

