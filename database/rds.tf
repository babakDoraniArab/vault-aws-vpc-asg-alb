resource "aws_db_subnet_group" "database-subnet-group" {
  name        = "database subnets"
  subnet_ids  = var.subnet_ids
  description = "subnet for Database Instance "

  tags = {
    Name      = "Database Subnets"
    Terraform = "true"
  }
}

# resource "aws_db_instance" "mysql_db" {
#   identifier        = "mysqldatabase"
#   storage_type      = "gp2"
#   allocated_storage = 20
#   instance_class    = var.instance_class
# }


# resource "aws_db_instance" "the_db" {
#   engine                 = "mariadb"
#   engine_version         = "10.5"
#   instance_class         = var.instance_class
#   db_name                = "prodmariadb"
#   identifier             = "prod-mariadb"
#   username               = var.username
#   password               = var.password
#   parameter_group_name   = "default.mariadb10.5"
#   db_subnet_group_name   = aws_db_subnet_group.database-subnet-group.name
#   vpc_security_group_ids = [aws_security_group.allow_mariadb.id]
#   skip_final_snapshot    = true
#   allocated_storage      = 50
#   max_allocated_storage  = 1000
# }

resource "aws_db_instance" "the_db" {
  allocated_storage      = 10
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = var.instance_class
  db_name                = "mydb"
  username               = var.username
  password               = var.password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.database-subnet-group.name
  vpc_security_group_ids = [aws_security_group.allow_mariadb.id]
}




resource "aws_security_group" "allow_mariadb" {
  name        = "prod-mariadb-rds-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Mariadb Access from within the VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow access to prod mariadb rds"
  }
}