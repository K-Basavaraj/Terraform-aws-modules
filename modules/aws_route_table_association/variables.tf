variable "route_table_id" {
  type        = string
  description = "(Required) The ID of the routing table to associate with"
}

variable "subnet_id" {
  type        = string
  description = "The subnet ID to create an association. Conflicts with gateway_id."
  default     = null
}

variable "gateway_id" {
  type        = string
  description = "The gateway ID to create an association. Conflicts with subnet_id."
  default     = null
}
