output "allocation_id" {
  value       = aws_eip.static_ip.id
  description = "ID that AWS assigns to represent the allocation of the Elastic IP address for use with instances in a VPC."
}

output "association_id" {
  value       = aws_eip.static_ip.association_id
  description = "ID representing the association of the address with an instance in a VPC."
}

output "carrier_ip" {
  value       = aws_eip.static_ip.carrier_ip
  description = "Carrier IP address."
}

output "customer_owned_ip" {
  value       = aws_eip.static_ip.customer_owned_ip
  description = "Customer owned IP."
}

output "id" {
  value       = aws_eip.static_ip.id
  description = "Contains the EIP allocation ID."
}

output "private_dns" {
  value       = aws_eip.static_ip.private_dns
  description = "The Private DNS associated with the Elastic IP address (if in VPC)."
}

output "private_ip" {
  value       = aws_eip.static_ip.private_ip
  description = "Contains the private IP address (if in VPC)."
}

output "ptr_record" {
  value       = aws_eip.static_ip.ptr_record
  description = "The DNS pointer (PTR) record for the IP address."
}

output "public_dns" {
  value       = aws_eip.static_ip.public_dns
  description = "Public DNS associated with the Elastic IP address."
}

output "public_ip" {
  value       = aws_eip.static_ip.public_ip
  description = "Contains the public IP address."
}
