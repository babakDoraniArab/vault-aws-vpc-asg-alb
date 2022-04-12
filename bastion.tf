resource "aws_instance" "web" {
  ami           = "ami-096f7a9ab885b50f4"
  instance_type = "t2.micro"

  subnet_id         = aws_subnet.public_1.id
  availability_zone = "eu-west-1a"




  security_groups = [aws_security_group.prod_web2.id]
  key_name        = "Demo2"




  tags = {
    Name      = "bastion"
    terraform = "true"
  }
}