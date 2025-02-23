variable "ami" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs for the instance"
  type        = list(string)
}

variable "key_name" {
  type        = string
  description = "Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair"
  default     = null
}

variable "monitoring" {
  type        = bool
  description = "If true, the launched EC2 instance will have detailed monitoring enabled."
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "VPC Subnet ID to launch in."
  default     = null
}

variable "tags" {
  description = "Tags to assign to the instance"
  type        = map(string)
}
