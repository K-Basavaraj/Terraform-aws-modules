output "arn" {
  value       = aws_vpc.vpc.arn
  description = "Amazon Resource Name (ARN) of VPC"
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "enable_dns_hostnames" {
  value       = aws_vpc.vpc.enable_dns_hostnames
  description = "Whether or not the VPC has DNS hostname support"
}

output "default_security_group_id" {
  value       = aws_vpc.vpc.default_security_group_id
  description = "The ID of the security group created by default on VPC creation"
}