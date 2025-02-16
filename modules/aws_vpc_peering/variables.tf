variable "peer_vpc_id" {
  type        = string
  description = "(Required) The ID of the target VPC with which you are creating the VPC Peering Connection."
}

variable "vpc_id" {
  type        = string
  description = "(Required) The ID of the requester VPC"
}

variable "auto_accept" {
  type        = bool
  description = "(Optional) Accept the peering (both VPCs need to be in the same AWS account and region)."
  default     = false
}

variable "is_peering_required" {
  type    = bool
  default = false
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."
}
