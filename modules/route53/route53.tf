resource "aws_route53_zone" "domain" {
  name = "babak.fi"

  tags = {
    Environment = "dev"
    Terraform   = "true"

  }
}

resource "aws_route53_record" "dev" {
  zone_id = aws_route53_zone.domain.zone_id
  name    = "dev.babak.fi"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.prod_web.dns_name]
}

output "aws_route53_record" {
  value = aws_route53_zone.domain.name_servers
}