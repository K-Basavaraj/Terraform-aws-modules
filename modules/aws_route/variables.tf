variable "route_table_id" {
  type        = string
  description = "(Required) The ID of the routing table."
}

variable "destination_cidr_block" {
  type        = string
  description = "The destination CIDR block."
  default     = null
}

variable "vpc_peering_connection_id" {
  type        = string
  description = "Identifier of a VPC peering connection."
  default     = null
}

variable "gateway_id" {
  type        = string
  description = "Identifier of a VPC internet gateway or a virtual private gateway."
  default     = null
}

variable "nat_gateway_id" {
  type        = string
  description = "(Optional) Identifier of a VPC NAT gateway."
  default     = null
}
