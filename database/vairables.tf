variable "username" {
  default = "admin"

}
variable "password" {
  default = "password"
}

variable "subnet_ids"{
  type = list(string)
}