
#////////////////////////////////
#   LoadBalancer
#////////////////////////////////
output "aws_lb_arn" {
  value     = aws_lb.prod_web.arn
  sensitive = false
}

output "aws_lb_id" {
  value     = aws_lb.prod_web.id
  sensitive = false
}

output "aws_lb_dns_name" {
  value     = aws_lb.prod_web.dns_name
  sensitive = false
}
output "aws_lb_arn_suffix" {
  value     = aws_lb.prod_web.arn_suffix
  sensitive = false
}
output "aws_lb_arn_suffix" {
  value     = aws_lb.prod_web.arn_suffix
  sensitive = false
}



