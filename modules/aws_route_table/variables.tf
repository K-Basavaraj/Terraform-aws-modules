variable "vpc_id" {
  type        = string
  description = "(Required) The VPC ID."
}

variable "propagating_vgws" {
  type        = list(string)
  description = "A list of virtual gateways for propagation"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
}
