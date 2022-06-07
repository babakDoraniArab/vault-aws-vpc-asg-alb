#frist we create a VPC Module 

module "vpc" {
  source              = "../../modules/vpc"
  cidr_vpc            = var.cidr_vpc
  cidr_public_1       = var.cidr_public_1
  cidr_public_2       = var.cidr_public_2
  cidr_private_1      = var.cidr_private_1
  cidr_private_2      = var.cidr_private_2
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
}

#2nd we create a RDS with the VPC Module output 
module "rds" {
  source     = "../../modules/database"
  subnet_ids = [module.vpc.aws_subnet_private_1_id, module.vpc.aws_subnet_private_2_id]
  vpc_id     = module.vpc.vpc_id

}



#3rd we need a bastion to connet to our private zone 
module "bastion" {
  source            = "../../modules/bastion"
  vpc_id            = module.vpc.vpc_id
  key_name          = var.key_name
  availability_zone = var.availability_zone_1
  subnet_id         = module.vpc.aws_subnet_public_1_id
}

#4th we create a asg-alb infra (it's not done yet )
module "asg-alb" {
  source            = "../../modules/asg-alb"
  vpc_id            = module.vpc.vpc_id
  key_name          = var.key_name
  availability_zone = var.availability_zone_1
  subnet_id         = module.vpc.aws_subnet_public_1_id
}
