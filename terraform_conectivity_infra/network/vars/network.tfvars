##################Virtual_private_cloud######
virtual_private_cloud = [{
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = false
  enable_dns_hostnames = true
  tags = {
    Name        = "expense-dev"
    Project     = "Expense"
    Terraform   = true
    Environment = "dev"
  }
}]

#################public_subnets################
public_subnet = [
  {
    name                    = "public-subnet-1"
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-east-1a"
    vpc_cidr                = "10.0.0.0/16"
    map_public_ip_on_launch = true
    tags = {
      Name        = "expense-dev-public-us-east-1a"
      Project     = "Expense"
      Terraform   = true
      Environment = "dev"
    }
  },
  {
    name                    = "public-subnet-2"
    cidr_block              = "10.0.2.0/24"
    availability_zone       = "us-east-1b"
    vpc_cidr                = "10.0.0.0/16"
    map_public_ip_on_launch = true
    tags = {
      Name        = "expense-dev-public-us-east-1b"
      Project     = "Expense"
      Terraform   = true
      Environment = "dev"
    }
  }
]

############private_subnets##########
private_subnet = [
  {
    name                    = "private-subnet-1"
    cidr_block              = "10.0.11.0/24"
    availability_zone       = "us-east-1a"
    vpc_cidr                = "10.0.0.0/16"
    map_public_ip_on_launch = false
    tags = {
      Name        = "expense-dev-private-us-east-1a"
      Project     = "Expense"
      Terraform   = true
      Environment = "dev"
    }
  },
  {
    name                    = "private-subnet-2"
    cidr_block              = "10.0.12.0/24"
    availability_zone       = "us-east-1b"
    vpc_cidr                = "10.0.0.0/16"
    map_public_ip_on_launch = false
    tags = {
      Name        = "expense-dev-private-us-east-1b"
      Project     = "Expense"
      Terraform   = true
      Environment = "dev"
    }
  }
]

##############Database_private_subnets##########
database_subnet = [
  {
    name                    = "database-subnet-1"
    cidr_block              = "10.0.21.0/24"
    availability_zone       = "us-east-1a"
    vpc_cidr                = "10.0.0.0/16"
    map_public_ip_on_launch = false
    tags = {
      Name        = "expense-dev-database-us-east-1a"
      Project     = "Expense"
      Terraform   = true
      Environment = "dev"
    }
  },
  {
    name                    = "database-subnet-2"
    cidr_block              = "10.0.22.0/24"
    availability_zone       = "us-east-1b"
    vpc_cidr                = "10.0.0.0/16"
    map_public_ip_on_launch = false
    tags = {
      Name        = "expense-dev-database-us-east-1b"
      Project     = "Expense"
      Terraform   = true
      Environment = "dev"
    }
  }
]

############SUBNETGROUPSFORDATABASE########
snetgroup_for_db = [{
  name        = "expense-dev-snetgrp"
  description = "DB subnet group"
  tags = {
    Name        = "expense-dev-snet-grp-01"
    Project     = "Expense"
    Terraform   = true
    Environment = "dev"
  }
}]


##########INTERNET_GATEWAY##############
internet_gateways = {
  "internet_gateway-01" = {
    tags = {
      Name        = "expense-dev-intgtw-01"
      Project     = "Expense"
      Terraform   = true
      Environment = "dev"
    }
  }
}

#######ELASTIC_IP_FOR_NATGATEWAY########
elastic_ip = {
  "elastic_ip_for_natgtw" = {
    domain = "vpc"
    tags = {
      Name        = "expense-dev-eip-01"
      Project     = "Expense"
      Terraform   = true
      Environment = "dev"
    }
  }
}

#############NATGATEWAY################
nat_gateways = {
  "nat_gateway-01" = {
    eip_name = "elastic_ip_for_natgtw"
    tags = {
      Name        = "expense-dev-natgtw-01"
      Project     = "Expense"
      Terraform   = true
      Environment = "dev"
    }
  }
}

############RouteTABLES#################
route_tables = {
  "public-route-table" = {
    tags = {
      Name = "expense-dev-public"
    }
  },
  "private-route-table" = {
    tags = {
      Name = "expense-dev-private"
    }
  },
  "database-route-table" = {
    tags = {
      Name = "expense-dev-database"
    }
  }
}

###########ROUTES#################
public_routes = [{
  name                   = "public-route"
  route_table_name       = "public-route-table"
  destination_cidr_block = "0.0.0.0/0"
  internet_gateway_name  = "internet_gateway-01"
}]

private_routes = [
  {
    name                   = "private-route"
    route_table_name       = "private-route-table"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_name       = "nat_gateway-01"
  },
  {
    name                   = "database-route"
    route_table_name       = "database-route-table"
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_name       = "nat_gateway-01"
  }
]

############ROUTE TABLE ASSOCIATION##########
public_rt_association = {
  "public-subnet-assoc-1" = {
    route_table_name = "public-route-table"
    subnet_name      = "public-subnet-1"
  }
  "public-subnet-assoc-2" = {
    route_table_name = "public-route-table"
    subnet_name      = "public-subnet-2"
  }
}

private_rt_association = {
  "private-subnet-assoc-1" = {
    route_table_name = "private-route-table"
    subnet_name      = "private-subnet-1"
  }
  "private-subnet-assoc-2" = {
    route_table_name = "private-route-table"
    subnet_name      = "private-subnet-2"
  }
}

database_rt_association = {
  "database-subnet-assoc-1" = {
    route_table_name = "database-route-table"
    subnet_name      = "database-subnet-1"
  }
  "database-subnet-assoc-2" = {
    route_table_name = "database-route-table"
    subnet_name      = "database-subnet-2"
  }
}

#####VPC_PEERING#######
vpc_peering = [{
  name                = "vpc_peering_default"
  is_peering_required = true
  auto_accept         = true
  tags = {
    Name        = "expense-dev-default"
    Project     = "Expense"
    Terraform   = true
    Environment = "dev"
  }
}]

########ROUTE PEERIG###########
is_peering_required = true
public_route_peer = [{
  name             = "public-route-peering-01"
  route_table_name = "public-route-table"
  peering_name     = "vpc_peering_default"
}]

private_route_peer = [
  {
    name             = "private-route-peering-01"
    route_table_name = "private-route-table"
    peering_name     = "vpc_peering_default"
  },
  {
    name             = "database-route-peering-01"
    route_table_name = "database-route-table"
    peering_name     = "vpc_peering_default"
  }
]

########ROUTE_PEERING_TO_DEFULT#############
defult_route_peer = [
  {
    name         = "defult-to-expencevpc-routepeering-01"
    peering_name = "vpc_peering_default"
    vpc_cidr     = "10.0.0.0/16"
  }
]
