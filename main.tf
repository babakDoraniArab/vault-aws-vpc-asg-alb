#frist we create a VPC Module 

module "vpc" {
  source = "./vpc"
}

#2nd we create a RDS with the VPC Module output 
module "rds" {
  source     = "./database"
  subnet_ids = [module.vpc.aws_subnet_private_1_id, module.vpc.aws_subnet_private_2_id]
  vpc_id     = module.vpc.vpc_id

}

#3rd we create a asg-alb infra 