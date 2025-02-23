variable "type" {
  type        = string
  description = "(Required) Type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
}

variable "description" {
  type        = string
  description = "(Optional) Description of the rule."
  default     = null
}

variable "from_port" {
  type        = string
  description = "(Required) Start port (or ICMP type number if protocol is icmp or icmpv6."
}

variable "to_port" {
  type        = string
  description = "(Required) End port (or ICMP code if protocol is icmp)."
}

variable "protocol" {
  type        = string
  description = "(Required) Protocol. If not icmp, icmpv6, tcp, udp, or all use"
}

variable "security_group_id" {
  type        = string
  description = "(Required) Security group to apply this rule to."
}

variable "source_security_group_id" {
  type        = string
  description = "(Optional) Security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or self."
  default     = null
}