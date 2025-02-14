#internet_gate_outputs
output "igw_id" {
  value = aws_internet_gateway.internet_gateway.id
}

output "arn" {
  value = aws_internet_gateway.internet_gateway.arn
}
