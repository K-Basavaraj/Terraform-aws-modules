variable "subnet_id" {
  type        = string
  description = "(Required) The Subnet ID of the subnet in which to place the NAT Gateway"
}

variable "allocation_id" {
  type        = string
  description = "The Allocation ID of the Elastic IP address for the NAT Gateway. Required for connectivity_type of public"
  default     = null
}

variable "connectivity_type" {
  type        = string
  description = "Connectivity type for the NAT Gateway."
  default     = "public"
}

variable "private_ip" {
  type        = string
  description = "The private IPv4 address to assign to the NAT Gateway."
  default     = null
}

variable "secondary_allocation_ids" {
  type        = list(string)
  description = "A list of secondary allocation EIP IDs for this NAT Gateway."
  default     = []
}

variable "secondary_private_ip_address_count" {
  type        = number
  description = "Private NAT Gateway only] The number of secondary private IPv4 addresses want to assign to the NAT Gateway."
  default     = null
}

variable "secondary_private_ip_addresses" {
  type        = list(string)
  description = "A list of secondary private IPv4 addresses to assign to the NAT Gateway."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
}
