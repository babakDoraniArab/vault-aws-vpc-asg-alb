variable "vpc_id" {

}

#////////////////////////////////
#  Security Group
#////////////////////////////////
variable "alb_sg_name" {
  default = "alb_sg"
  type    = string
}
variable "web_sg_name" {
  default = "web_sg"
}

variable "alb_sg_cidr_ingress" {
  default = ["0.0.0.0/0"]
}

variable "var.bastion_sg_security_group_name" {
  type        = list(string)
  description = "you need to write the bastion ip address"
}


#////////////////////////////////
#  Launch configuration Group
#////////////////////////////////

variable "launch_configuration_instance_name" {
  default = "web"
}
variable "key_name" {
  default = "Demo2"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "ami" {
  default = "ami-096f7a9ab885b50f4"
}

#////////////////////////////////
#   Auto Scaling Group
#////////////////////////////////
variable "aws_autoscaling_group_name" {
  default = "wep-asg"
}

variable "aws_autoscaling_group_max_size" {
  default = 5
}

variable "aws_autoscaling_group_min_size" {
  default = 2
}

variable "aws_autoscaling_group_desired_capacity" {
  default = 2
}

variable "vpc_zone_identifier" {
  type = list(string)
}

#////////////////////////////////
#   LoadBalancer
#////////////////////////////////

variable "aws_lb_name" {
  default = "prod_web_loadbalancer"
}
variable "aws_lb_internal_status" {
  default = false
}

variable "aws_lb_subnets" {
  type = list(string)
}
variable "aws_lb_target_group" {
  default = "prod-web-target-group"
}



# variable "availability_zone" {

# }
# variable "subnet_id" {

# }

# variable "bastion_sg_name" {
#   default = "bastion_sg"
# }