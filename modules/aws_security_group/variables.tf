variable "sg_name" {
  type        = string
  description = "Name of the security group."
}

variable "description" {
  type        = string
  description = "Security group description."
  default     = null
}

variable "name_prefix" {
  type        = string
  description = "(optional) Creates a unique name beginning with the specified prefix. Conflicts with name."
  default     = null
}

variable "revoke_rules_on_delete" {
  type        = bool
  description = "(Optional) Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself."
  default     = false
}

variable "vpc_id" {
  type        = string
  description = "(Optional, Forces new resource) VPC ID. Defaults to the region's default VPC."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "a map of string to assign to the resource."
}

variable "egress" {
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    prefix_list_ids  = optional(list(string))
    security_groups  = optional(list(string))
    description      = optional(string)
    self             = optional(string)
  }))
  description = "outgoing traffic"
  default     = []
}

variable "ingress" {
  type = list(object({
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = optional(list(string))
    ipv6_cidr_blocks = optional(list(string))
    prefix_list_ids  = optional(list(string))
    security_groups  = optional(list(string))
    description      = optional(string)
    self             = optional(string)
  }))
  description = "incomming traffic"
  default     = []
}
