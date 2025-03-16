variable "cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for the VPC."
}

variable "instance_tenancy" {
  type        = string
  description = "A tenancy option for instances launched into the VPC. which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched."
  default     = "default"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "To enable/disable DNS hostnames in the VPC."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
}