#frist we create a VPC Module 

module "vpc" {
    source = "./vpc"
}

#2nd we create a RDS with the VPC Module output 
module "rds" {
    source = "./rds"
    subnet_ids=[aws_subnet_private_1_id.value]

}

#3rd we create a asg-alb infra 