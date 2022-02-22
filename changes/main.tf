provider "aws" {
    region = var.AWS_REGION
    access_key = var.instance_accesskey
    secret_key = var.instance_secretkey
}

module "vpc" {
 source  = "./modules/vpc"
 availability-zone1 = var.availability-zone1
 availability-zone2 = var.availability-zone2
 cidr_block = var.cidr_block
 subnet1 = var.subnet1
 subnet2 = var.subnet2
 cidr_block2 = var.cidr_block2
 }

