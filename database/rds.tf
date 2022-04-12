resource "aws_db_instance" "mysql_db" {
  identifier        = "mysqldatabase"
  storage_type      = "gp2"
  allocated_storage = 20


}