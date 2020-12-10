####################
# For providers.tf #
####################
aws_region                  = "ap-northeast-1"
aws_shared_credentials_file = "~/.aws/credentials"

##############
# For vpc.tf #
##############
hobo_prod_vpc = {
  cidr                 = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  tags = {
    Name = "Prod VPC"
  }
}

hobo_prod_public_subnet_01 = {
  cidr                    = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "Prod Public Subnet 01"
  }
}

hobo_prod_public_subnet_02 = {
  cidr                    = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "Prod Public Subnet 02"
  }
}

hobo_prod_private_subnet_01 = {
  availability_zone       = "ap-northeast-1a"
  cidr                    = "10.0.3.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "Prod Private Subnet 01"
  }
}

hobo_prod_private_subnet_02 = {
  availability_zone       = "ap-northeast-1c"
  cidr                    = "10.0.4.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "Prod Private Subnet 02"
  }
}

hobo_prod_private_subnet_03 = {
  availability_zone       = "ap-northeast-1d"
  cidr                    = "10.0.4.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "Prod Private Subnet 03"
  }
}

hobo_prod_internet_gateway = {
  tags = {
    Name = "Prod Internet Gateway"
  }
}

hobo_prod_route_table_public_subnet = {
  tags = {
    Name = "Prod Route Table For Public Subnet"
  }
}

hobo_prod_route_internet_gateway = {
  destination_cidr_block = "0.0.0.0/0"
}

hobo_prod_elastic_ip = {
  vpc = true
  tags = {
    Name = "Prod Elastic IP Name"
  }
}

hobo_prod_nat_gateway = {
  tags = {
    Name = "Prod NAT Gateway Name"
  }
}

hobo_prod_route_table_private_subnet = {
  tags = {
    Name = "Prod Route Table For Private Subnet"
  }
}

hobo_prod_route_nat_gateway = {
  destination_cidr_block = "0.0.0.0/0"
}

hobo_prod_security_group_cluster = {
  name = "Prod Cluster Security Group"
  description = "Security Group For Cluster"
  tags = {
    Name = "Prod Cluster Security Group"
  }
}

hobo_prod_cluster_ingress_rule = {
  cidr_blocks = ["113.160.19.218/32","118.70.133.189/32"]
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  description = "Allow workstation to communicate with API Server"
}

hobo_prod_cluster_egress_rule = {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  description = "Cluster communication with worker nodes"
}

hobo_prod_security_group_aurora = {
  name = "Prod Aurora Security Group"
  description = "Security Group For Aurora"
  tags = {
    Name  = "Prod Aurora Security Group"
  }
}

hobo_prod_aurora_ingress_rule = {
  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
  cidr_blocks = ["10.0.0.0/16"]
  description = "Allow Aurora on port 3306"
}