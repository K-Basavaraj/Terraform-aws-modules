# This output generates a map where:
# - The VPC CIDR block is the key.
# - The value is an object containing the corresponding VPC ID.
# This allows referencing VPC IDs dynamically using the CIDR block as the key.
output "network_outputs" {
  value = {
    aws_vpc = { for vpcid, value in module.vpc : vpcid =>
      {
        id = value.vpc_id
      }
    }
    pub_snet  = { for snetid, value in module.public_subnet : snetid => value.snet_id }
    priv_snet = { for snetid, value in module.private_subnet : snetid => value.snet_id }
    db_set    = { for snetid, value in module.database_subnet : snetid => value.snet_id }

  }
}


#### # - The `internet_gate_way` key contains a list of IGW IDs.
output "gateways" {
  value = {
    internet_gateway = [for ids in module.internet_gateway : ids.igw_id]
    nat_gateway      = [for ids in module.nat_gateway : ids.nat_gtw_id]
  }
}
