#####virtual_private_cloud##########################
module "vpc" {
  source               = "../../modules/aws_vpc"
  for_each             = { for vpcs in var.virtual_private_cloud : vpcs.cidr_block => vpcs }
  cidr_block           = each.value.cidr_block
  enable_dns_support   = each.value.enable_dns_support
  enable_dns_hostnames = each.value.enable_dns_hostnames
  tags                 = each.value.tags
}

##########public######################################
module "public_subnet" {
  source            = "../../modules/aws_subnet"
  for_each          = { for snet in var.public_subnet : snet.name => snet }
  cidr_block        = each.value.cidr_block
  vpc_id            = module.vpc[each.value.vpc_cidr].vpc_id
  availability_zone = each.value.availability_zone
  tags              = each.value.tags
}

#########privatesubnet##########
module "private_subnet" {
  source            = "../../modules/aws_subnet"
  for_each          = { for snet in var.private_subnet : snet.name => snet }
  cidr_block        = each.value.cidr_block
  vpc_id            = module.vpc[each.value.vpc_cidr].vpc_id
  availability_zone = each.value.availability_zone
  tags              = each.value.tags
}

##########Databasesubnets###########
module "database_subnet" {
  source            = "../../modules/aws_subnet"
  for_each          = { for snet in var.database_subnet : snet.name => snet }
  cidr_block        = each.value.cidr_block
  vpc_id            = module.vpc[each.value.vpc_cidr].vpc_id
  availability_zone = each.value.availability_zone
  tags              = each.value.tags
}

######################################
module "db_subnet_groups" {
  source      = "../../modules/aws_db_subnet_group"
  for_each    = { for dbsnetgrp in var.snetgroup_for_db : dbsnetgrp.name => dbsnetgrp }
  name        = each.value.name
  subnet_ids  = values(module.database_subnet)[*].snet_id
  description = each.value.description
  tags        = each.value.tags
}

##########internet_gateway#########################
module "internet_gateway" {
  source   = "../../modules/aws_internet_gateway"
  for_each = var.internet_gateways
  vpc_id   = values(module.vpc)[0].vpc_id
  tags     = each.value.tags
}


###########Elastic_ip for natgateway#############################
module "eip_for_nat" {
  source   = "../../modules/aws_eip"
  for_each = var.elastic_ip
  domain   = each.value.domain
  tags     = each.value.tags
}


#############NATGATEWAY#########################################
module "nat_gateway" {
  source        = "../../modules/aws_nat_gateway"
  for_each      = var.nat_gateways
  subnet_id     = values(module.public_subnet)[0].snet_id
  allocation_id = module.eip_for_nat[each.value.eip_name].id
  tags          = each.value.tags
  depends_on = [
    module.internet_gateway
  ]
}

#############ROUTETABLE##############################
module "route_table" {
  source   = "../../modules/aws_route_table"
  for_each = var.route_tables
  vpc_id   = values(module.vpc)[0].vpc_id
  tags     = each.value.tags
}

################Routes##############################
module "public_route" {
  source                 = "../../modules/aws_route"
  for_each               = { for rt in var.public_routes : rt.name => rt }
  route_table_id         = module.route_table[each.value.route_table_name].route_table_id
  destination_cidr_block = each.value.destination_cidr_block
  gateway_id             = module.internet_gateway[each.value.internet_gateway_name].igw_id
  depends_on = [
    module.route_table,
    module.nat_gateway,
    module.internet_gateway
  ]
}

module "priavte_route" {
  source                 = "../../modules/aws_route"
  for_each               = { for rt in var.private_routes : rt.name => rt }
  route_table_id         = module.route_table[each.value.route_table_name].route_table_id
  destination_cidr_block = each.value.destination_cidr_block
  nat_gateway_id         = module.nat_gateway[each.value.nat_gateway_name].nat_gtw_id
  depends_on = [
    module.route_table,
    module.nat_gateway,
    module.internet_gateway
  ]
}

########ROUTE_TABLE_ASSOCIATION############
module "public_route_table_association" {
  source         = "../../modules/aws_route_table_association"
  for_each       = var.public_rt_association
  route_table_id = module.route_table[each.value.route_table_name].route_table_id
  subnet_id      = module.public_subnet[each.value.subnet_name].snet_id
}

module "private_route_table_association" {
  source         = "../../modules/aws_route_table_association"
  for_each       = var.private_rt_association
  route_table_id = module.route_table[each.value.route_table_name].route_table_id
  subnet_id      = module.private_subnet[each.value.subnet_name].snet_id
}

module "database_route_table_association" {
  source         = "../../modules/aws_route_table_association"
  for_each       = var.database_rt_association
  route_table_id = module.route_table[each.value.route_table_name].route_table_id
  subnet_id      = module.database_subnet[each.value.subnet_name].snet_id
}

module "vpc_peering" {
  source              = "../../modules/aws_vpc_peering"
  for_each            = { for vpcper in var.vpc_peering : vpcper.name => vpcper }
  is_peering_required = each.value.is_peering_required
  vpc_id              = values(module.vpc)[0].vpc_id
  peer_vpc_id         = data.aws_vpc.default.id
  auto_accept         = each.value.auto_accept
  tags                = each.value.tags
}

module "public_route_peering" {
  source                    = "../../modules/aws_route"
  for_each                  = var.is_peering_required ? { for rpeer in var.public_route_peer : rpeer.name => rpeer } : {}
  route_table_id            = module.route_table[each.value.route_table_name].route_table_id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = module.vpc_peering[each.value.peering_name].peering_id
}

module "private_route_peering" {
  source                    = "../../modules/aws_route"
  for_each                  = var.is_peering_required ? { for rpeer in var.private_route_peer : rpeer.name => rpeer } : {}
  route_table_id            = module.route_table[each.value.route_table_name].route_table_id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = module.vpc_peering[each.value.peering_name].peering_id
}

module "default_peering_to_vpc" {
  source                    = "../../modules/aws_route"
  for_each                  = var.is_peering_required ? { for rpeer in var.defult_route_peer : rpeer.name => rpeer } : {}
  route_table_id            = data.aws_route_table.main.route_table_id
  destination_cidr_block    = module.vpc[each.value.vpc_cidr].cidr_block
  vpc_peering_connection_id = module.vpc_peering[each.value.peering_name].peering_id
}

###############AWS_SECURITYGROUP#############
module "security_group" {
  source      = "../../modules/aws_security_group"
  for_each    = { for sg in var.security_group : sg.name => sg }
  sg_name     = each.value.name
  vpc_id      = values(module.vpc)[0].vpc_id
  description = each.value.description
  egress      = each.value.egress
  tags        = each.value.tags
}