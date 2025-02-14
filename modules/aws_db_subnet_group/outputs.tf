output "id" {
  value = aws_db_subnet_group.db_subnet_group.id
}

output "arn" {
  value = aws_db_subnet_group.db_subnet_group.arn
}

output "supported_network_types" {
  value = aws_db_subnet_group.db_subnet_group.supported_network_types
}

output "vpc_id" {
  value = aws_db_subnet_group.db_subnet_group.vpc_id
}
