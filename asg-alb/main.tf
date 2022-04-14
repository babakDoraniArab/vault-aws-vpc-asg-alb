#////////////////////////////////
#  Security Group
#////////////////////////////////

resource "aws_security_group" "web_sg" {
  name        = var.web_sg.name
  description = "Allow standard http and https ports inbount and everything outbound"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_security_group.alb_sg]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_security_group.alb_sg]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.bastion_sg_security_group_name
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform" : "true"
  }
}
resource "aws_security_group" "alb_sg" {
  name        = var.alb_sg_name
  description = "Allow standard http and https ports inbount and everything outbound"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.alb_sg_cidr_ingress
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.alb_sg_cidr_ingress
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Terraform" : "true"
  }
}
#////////////////////////////////
#   Auto Scaling Group
#////////////////////////////////
resource "aws_launch_configuration" "prod_web" {
  name            = var.launch_configuration_instance_name
  image_id        = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web_sg.id]
  key_name        = var.key_name
  user_data       = file("webserver.sh")
}

resource "aws_autoscaling_group" "prod_web" {
  name                 = var.aws_autoscaling_group_name
  max_size             = var.aws_autoscaling_group_max_size
  min_size             = var.aws_autoscaling_group_min_size
  desired_capacity     = var.aws_autoscaling_group_desired_capacity
  launch_configuration = aws_launch_configuration.prod_web.name
  vpc_zone_identifier  = var.vpc_zone_identifier
}

#////////////////////////////////
#   LoadBalancer
#////////////////////////////////
resource "aws_lb" "prod_web" {
  name               = var.aws_lb_name
  internal           = var.aws_lb_internal_status
  load_balancer_type = "application"

  security_groups = [aws_security_group.alb_sg.id]
  subnets         = var.aws_lb_subnets

  tags = {
    "Terraform" : "true"
  }

}

resource "aws_lb_target_group" "prod_web" {
  name     = "prod-web"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  tags = {
    "Terraform" : "true"
  }
}

#////////////////////////////////
#   Auto Scaling Attachment
#////////////////////////////////
# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.prod_web.id
  alb_target_group_arn   = aws_lb_target_group.prod_web.arn
}


#////////////////////////////////
#   AWS LoadBalancing Listener
#////////////////////////////////
# Create a new ALB Target Group attachment

resource "aws_lb_listener" "prod_web" {
  load_balancer_arn = aws_lb.prod_web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.prod_web.arn
  }
}