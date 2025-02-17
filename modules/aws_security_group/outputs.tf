output "arn" {
  value = aws_security_group.awsnsg.arn
  description = "ARN of the security group."
}

output "id" {
  value = aws_security_group.awsnsg.id
  description = "ID of the security group."
}

output "owner_id" {
  value = aws_security_group.awsnsg.owner_id
  description = "Owner ID."
}

output "tags_all" {
  value = aws_security_group.awsnsg.tags_all
  description = "A map of all tags assigned to the resource, including those inherited from the provider default_tags."
}