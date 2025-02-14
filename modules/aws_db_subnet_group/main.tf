resource "aws_db_subnet_group" "db_subnet_group" {
  name        = var.name
  subnet_ids  = var.subnet_ids
  name_prefix = var.name_prefix
  description = var.description
  tags        = var.tags
}
