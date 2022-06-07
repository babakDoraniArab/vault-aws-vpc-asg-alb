################################
## bastion output 
################################

output "bastion_arn" {
  value = aws_instance.bastion.arn
  sensitive = false
}
output "bastion_private_dns" {
  value = aws_instance.bastion.private_dns
  sensitive = false
}
output "bastion_public_dns" {
  value = aws_instance.bastion.public_dns
  sensitive = false
}
output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
  sensitive = false
}
