variable "vpc_id" {
  type        = string
  description = "The VPC ID to create in."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
}

