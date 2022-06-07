variable "name" {
  default = "bastion"
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
variable "vpc_id" {

}
variable "bastion_sg_cidr_ingress" {
  default = ["0.0.0.0/0"]
}
variable "availability_zone" {

}
variable "subnet_id" {

}

variable "bastion_sg_name" {
  default = "bastion_sg"
}