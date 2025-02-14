variable "address" {
  type        = string
  default     = null
  description = "The Elastic IP address to associate with the instance."
}

variable "associate_with_private_ip" {
  type        = string
  default     = null
  description = "The private IP address to associate with the Elastic IP."
}

variable "domain" {
  type        = string
  default     = null
  description = "Indicates if this EIP is for a VPC or standard EC2-Classic."
}

variable "instance" {
  type        = string
  default     = null
  description = "The ID of the instance to associate with the EIP."
}

variable "ipam_pool_id" {
  type        = string
  default     = null
  description = "The ID of an IPAM pool to use for this EIP."
}

variable "network_border_group" {
  type        = string
  default     = null
  description = "The location from which the EIP address is advertised."
}

variable "network_interface" {
  type        = string
  default     = null
  description = "The ID of the network interface to associate with the EIP."
}

variable "public_ipv4_pool" {
  type        = string
  default     = null
  description = "The ID of a public IPv4 pool from which to allocate the EIP."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to assign to the resource."
}