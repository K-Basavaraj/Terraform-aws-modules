variable "cidr_block" {
  type        = string
  description = "The CIDR block for the subnet"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID to create in."
}

variable "availability_zone" {
  type        = string
  description = "The AZ for the subnet"
  default     = null
}

variable "availability_zone_id" {
  type        = string
  description = "The AZ id for the subnet"
  default     = null
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
}
