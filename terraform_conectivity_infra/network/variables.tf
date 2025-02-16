#####virtual private cloud###############
variable "virtual_private_cloud" {}

variable "public_subnet" {}
variable "private_subnet" {}
variable "database_subnet" {}

variable "snetgroup_for_db" {}

variable "internet_gateways" {}
variable "elastic_ip" {}
variable "nat_gateways" {}

variable "route_tables" {}
variable "public_routes" {}
variable "private_routes" {}

variable "public_rt_association" {}
variable "private_rt_association" {}
variable "database_rt_association" {}

variable "vpc_peering" {}
variable "public_route_peer" {}
variable "is_peering_required" {
  type = bool
  default = false
}
variable "private_route_peer" {}
variable "defult_route_peer" {}