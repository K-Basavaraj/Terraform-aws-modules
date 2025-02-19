output "sg_rule_id" {
  value = aws_security_group_rule.sg_rules.id
}

output "source_security_group_id" {
  value = aws_security_group_rule.sg_rules.source_security_group_id
}