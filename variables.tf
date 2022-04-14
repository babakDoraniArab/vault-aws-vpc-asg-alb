
################################
## VPC variables
################################
variable "cidr_vpc" {
  default     = "192.168.0.0/16"
  description = "main vpc cidr "
}
variable "cidr_public_1" {
  default     = "192.168.1.0/24"
  description = "main vpc cidr "
}
variable "cidr_public_2" {
  default     = "192.168.11.0/24"
  description = "main vpc cidr "
}
variable "cidr_private_1" {
  default     = "192.168.2.0/24"
  description = "main vpc cidr "
}
variable "cidr_private_2" {
  default = "192.168.12.0/24"
}
variable "availability_zone_1" {
  default = "eu-west-1a"
}
variable "availability_zone_2" {
  default = "eu-west-1b"
}
################################
## RDS variables
################################

variable "username" {
  default = "admin"

}
variable "password" {
  default = "password"
}

variable "instance_class" {
  default = "db.t2.micro"
}