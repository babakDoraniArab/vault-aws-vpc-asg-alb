################################
## VPC variables
################################
cidr_vpc = "192.168.0.0/16"

cidr_public_1  = "192.168.1.0/24"
cidr_private_1 = "192.168.2.0/24"

cidr_public_2  = "192.168.11.0/24"
cidr_private_2 = "192.168.12.0/24"

availability_zone_1 = "eu-west-1a"
availability_zone_2 = "eu-west-1b"
################################
## RDS variables
################################
username       = "admin"
password       = "password"
instance_class = "db.t2.micro"