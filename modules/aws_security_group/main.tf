#aws_security_group
resource "aws_security_group" "awsnsg" {
  name                   = var.sg_name
  description            = var.description
  name_prefix            = var.name_prefix
  revoke_rules_on_delete = var.revoke_rules_on_delete
  vpc_id                 = var.vpc_id
  tags                   = var.tags
  dynamic "egress" {
    for_each = var.egress != null ? var.egress : []
    content {
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
      prefix_list_ids  = egress.value.prefix_list_ids
      security_groups  = egress.value.security_groups
      description      = egress.value.description
      self             = egress.value.self
    }
  }
  dynamic "ingress" {
    for_each = var.ingress != null ? var.ingress : []
    content {
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
      prefix_list_ids  = ingress.value.prefix_list_ids
      security_groups  = ingress.value.security_groups
      description      = ingress.value.description
      self             = ingress.value.self
    }
  }



}
