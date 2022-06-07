variable "username" {
  default = "admin"

}
variable "password" {
  default = "password"
}

variable "subnet_ids" {
}

variable "vpc_id" {

}

variable "instance_class" {
  default = "db.t2.micro"
}