#####virtual private cloud###############
variable "virtual_private_cloud" {}

variable "public_subnet" {}
variable "private_subnet" {}
variable "database_subnet" {}

variable "internet_gateways" {}
variable "elastic_ip" {}
variable "nat_gateways" {}

variable "route_tables" {}
variable "public_routes" {}
variable "private_routes" {}

variable "public_rt_association" {}
variable "private_rt_association" {}
variable "database_rt_association" {}
