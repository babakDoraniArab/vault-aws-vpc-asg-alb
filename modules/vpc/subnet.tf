resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_public_1
  #AZ availability zone eu-west-1a
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name      = "public-eu-west-1a"
    Terraform = "true"
  }
}


resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_private_1
  #AZ availability zone eu-west-1a
  availability_zone = var.availability_zone_1


  tags = {
    Name      = "private-eu-west-1a"
    Terraform = "true"
  }
}



resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_public_2
  #AZ availability zone eu-west-1b
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name      = "public-eu-west-1b"
    Terraform = "true"
  }
}


resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_private_2
  #AZ availability zone eu-west-1b
  availability_zone = var.availability_zone_2


  tags = {
    Name      = "private-eu-west-1b"
    Terraform = "true"
  }
}


