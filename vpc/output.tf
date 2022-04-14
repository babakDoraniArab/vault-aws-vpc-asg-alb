################################
## VPC
################################

output "vpc_id" {
  value       = aws_vpc.main.id
  description = "vpc id"
  sensitive   = false
}
output "vpc_arn" {
  value       = aws_vpc.main.arn
  description = "vpc arn"
  sensitive   = false
}
output "vpc_instance_tenancy" {
  value       = aws_vpc.main.instance_tenancy
  description = "vpc instance_tenancy"
  sensitive   = false
}
output "vpc_enable_dns_support" {
  value       = aws_vpc.main.enable_dns_support
  description = "vpc enable_dns_support"
  sensitive   = false
}
output "vpc_enable_dns_hostnames" {
  value       = aws_vpc.main.enable_dns_hostnames
  description = "vpc enable_dns_hostnames"
  sensitive   = false
}
output "vpc_enable_classiclink" {
  value       = aws_vpc.main.enable_classiclink
  description = "vpc enable_classiclink"
  sensitive   = false
}
output "vpc_default_route_table_id" {
  value       = aws_vpc.main.default_route_table_id
  description = "vpc default_route_table_id"
  sensitive   = false
}
output "vpc_main_route_table_id" {
  value       = aws_vpc.main.main_route_table_id
  description = "vpc main_route_table_id"
  sensitive   = false
}
output "vpc_default_network_acl_id" {
  value       = aws_vpc.main.default_network_acl_id
  description = "vpc default_network_acl_id"
  sensitive   = false
}
output "vpc_default_security_group_id" {
  value       = aws_vpc.main.default_security_group_id
  description = "vpc default_security_group_id"
  sensitive   = false
}

################################
## GW1
################################

output "aws_nat_gateway_gw1_id" {
  value       = aws_nat_gateway.gw1.id
  description = "internet gateway id"
  sensitive   = false
}
output "aws_nat_gateway_gw1_allocation_id" {
  value       = aws_nat_gateway.gw1.allocation_id
  description = "gateway_nat1_allocation_id"
  sensitive   = false
}
output "aws_nat_gateway_gw1_subnet_id" {
  value       = aws_nat_gateway.gw1.subnet_id
  description = "gateway_nat1_subnet_id"
  sensitive   = false
}
output "aws_nat_gateway_gw1_private_ip" {
  value       = aws_nat_gateway.gw1.private_ip
  description = "gateway_nat1_private_ip"
  sensitive   = false
}
output "aws_nat_gateway_gw1_public_ip" {
  value       = aws_nat_gateway.gw1.public_ip
  description = "gateway_nat1_public_ip"
  sensitive   = false
}
output "aws_nat_gateway_gw1_tags_all" {
  value       = aws_nat_gateway.gw1.tags_all
  description = "gateway_nat1_tags_all"
  sensitive   = false
}



################################
## internet gateway
################################

output "internet_gateway_id" {
  value       = aws_internet_gateway.main.id
  description = "internet gateway id"
  sensitive   = false
}
output "internet_gateway_arn" {
  value       = aws_internet_gateway.main.arn
  description = "internet gateway arn"
  sensitive   = false
}
output "internet_gateway_owner_id" {
  value       = aws_internet_gateway.main.owner_id
  description = "internet gateway owner_id"
  sensitive   = false
}
output "internet_gateway_tags_all" {
  value       = aws_internet_gateway.main.tags_all
  description = "internet gateway tags_all"
  sensitive   = false
}





################################
## aws subnets public_1 private_1
################################

output "aws_subnet_public_1_id" {
  value       = aws_subnet.public_1.id
  description = "aws subnet for pulibc 1"
  sensitive   = false
}
output "aws_subnet_public_1_arn" {
  value       = aws_subnet.public_1.arn
  description = "aws subnet arn"
  sensitive   = false
}

output "aws_subnet_private_1_id" {
  value       = aws_subnet.private_1.id
  description = "aws subnet for pulibc 1"
  sensitive   = false
}
output "aws_subnet_private_1_arn" {
  value       = aws_subnet.private_1.arn
  description = "aws subnet arn"
  sensitive   = false
}


################################
## aws subnets public_2 private_2
################################

output "aws_subnet_public_2_id" {
  value       = aws_subnet.public_2.id
  description = "aws subnet for pulibc 2"
  sensitive   = false
}
output "aws_subnet_public_2_arn" {
  value       = aws_subnet.public_2.arn
  description = "aws subnet arn"
  sensitive   = false
}

output "aws_subnet_private_2_id" {
  value       = aws_subnet.private_2.id
  description = "aws subnet for pulibc 2"
  sensitive   = false
}
output "aws_subnet_private_2_arn" {
  value       = aws_subnet.private_2.arn
  description = "aws subnet arn"
  sensitive   = false
}

################################
## eip 
################################
output "aws_eip_id" {
  value       = aws_eip.nat1.id
  sensitive   = false
}
output "aws_eip_public_ip" {
  value       = aws_eip.nat1.public_ip
  sensitive   = false
}
output "aws_eip_public_dns" {
  value       = aws_eip.nat1.public_dns
  sensitive   = false
}
output "aws_eip_carrier_ip" {
  value       = aws_eip.nat1.carrier_ip
  sensitive   = false
}
output "aws_eip_allocation_id" {
  value       = aws_eip.nat1.allocation_id
  sensitive   = false
}
output "aws_eip_association_id" {
  value       = aws_eip.nat1.association_id
  sensitive   = false
}



################################
## routing-table  public 
################################
output "aws_route_table_public_id" {
  value       = aws_route_table.public.id
  sensitive   = false
}
output "aws_route_table_public_arn" {
  value       = aws_route_table.public.arn
  sensitive   = false
}
################################
## routing-table  private1 
################################
output "aws_route_table_private1_id" {
  value       = aws_route_table.private1.id
  sensitive   = false
}
output "aws_route_table_private1_arn" {
  value       = aws_route_table.private1.arn
  sensitive   = false
}