####################
# For providers.tf #
####################
aws_region                  = "ap-northeast-1"
aws_shared_credentials_file = "../../../.aws/credentials"

######################
# For staging-vpc.tf #
######################
hobo_staging_vpc = {
  cidr                 = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  tags = {
    Name = "Staging VPC"
  }
}

hobo_staging_public_subnet = {
  cidr                    = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "Staging Public Subnet"
  }
}

hobo_staging_private_subnet = {
  cidr                    = "10.0.2.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "Staging Private Subnet"
  }
}

hobo_staging_internet_gateway = {
  tags = {
    Name = "Staging Internet Gateway"
  }
}

hobo_staging_route_table_public_subnet = {
  tags = {
    Name = "Staging Route Table For Public Subnet"
  }
}

hobo_staging_route_internet_gateway = {
  destination_cidr_block = "0.0.0.0/0"
}

hobo_staging_elastic_ip = {
  vpc = true
  tags = {
    Name = "Staging Elastic IP Name"
  }
}

hobo_staging_nat_gateway = {
  tags = {
    Name = "Staging NAT Gateway Name"
  }
}

hobo_staging_route_table_private_subnet = {
  tags = {
    Name = "Staging Route Table For Private Subnet"
  }
}

hobo_staging_route_nat_gateway = {
  destination_cidr_block = "0.0.0.0/0"
}

hobo_staging_security_group_cluster = {
  name = "Staging Cluster Security Group"
  description = "Security Group For Cluster"
  tags = {
    Name = "Staging Cluster Security Group"
  }
}

hobo_staging_cluster_ingress_rule = {
  cidr_blocks = ["113.160.19.218/32","118.70.133.189/32"]
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  description = "Allow workstation to communicate with API Server"
}

hobo_staging_cluster_egress_rule = {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  description = "Cluster communication with worker nodes"
}

hobo_staging_security_group_aurora = {
  name = "Staging Aurora Security Group"
  description = "Security Group For Aurora"
  tags = {
    Name  = "Staging Aurora Security Group"
  }
}

hobo_staging_aurora_ingress_rule = {
  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
  cidr_blocks = ["10.0.0.0/16"]
  description = "Allow Aurora on port 3306"
}