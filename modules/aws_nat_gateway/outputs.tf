output "nat_gtw_id" {
  value = aws_nat_gateway.nat_gateway.id
}

output "association_id" {
  value = aws_nat_gateway.nat_gateway.association_id
}

output "network_interface_id" {
  value = aws_nat_gateway.nat_gateway.network_interface_id
}

output "public_ip" {
  value = aws_nat_gateway.nat_gateway.public_ip
}
