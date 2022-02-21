provider "aws" {
    region = var.AWS_REGION
}

module "vpc" {
 source  = "./modules/vpc"
 availability-zone1 = var.availability-zone1
 availability-zone2 = var.availability-zone2
 }
