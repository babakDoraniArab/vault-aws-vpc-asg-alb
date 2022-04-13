resource "aws_eip" "nat1" {
  #for availablity zone 1 ( public1 and private1 )
  depends_on = [aws_internet_gateway.main]

  tags = {
    Terraform = "true"
  }
}
