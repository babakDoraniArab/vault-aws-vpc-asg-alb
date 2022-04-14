resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.instance_type

  subnet_id         = var.subnet_id
  availability_zone = var.availability_zone




  security_groups = [aws_security_group.bastion_sg.id]
  key_name        = var.key_name




  tags = {
    Name      = var.name,
    terraform = "true"
  }
}



resource "aws_security_group" "bastion_sg" {
  name        = var.bastion_sg_name
  description = "Allow standard ssh deafult availble for all incoming but you can manage it with variables."
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.bastion_sg_cidr_ingress
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