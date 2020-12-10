####################
# For providers.tf #
####################
aws_region                  = "ap-northeast-1"
aws_shared_credentials_file = "~/.aws/credentials"

##############
# For vpc.tf #
##############
hobo_preview_vpc = {
  cidr                 = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  tags = {
    Name = "Preview VPC"
  }
}

hobo_preview_public_subnet_01 = {
  cidr                    = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "Preview Public Subnet 01"
  }
}

hobo_preview_public_subnet_02 = {
  cidr                    = "10.0.2.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "Preview Public Subnet 02"
  }
}

hobo_preview_private_subnet_01 = {
  availability_zone       = "ap-northeast-1a"
  cidr                    = "10.0.3.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "Preview Private Subnet 01"
  }
}

hobo_preview_private_subnet_02 = {
  availability_zone       = "ap-northeast-1c"
  cidr                    = "10.0.4.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "Preview Private Subnet 02"
  }
}

hobo_preview_internet_gateway = {
  tags = {
    Name = "Preview Internet Gateway"
  }
}

hobo_preview_route_table_public_subnet = {
  tags = {
    Name = "Preview Route Table For Public Subnet"
  }
}

hobo_preview_route_internet_gateway = {
  destination_cidr_block = "0.0.0.0/0"
}

hobo_preview_elastic_ip = {
  vpc = true
  tags = {
    Name = "Preview Elastic IP Name"
  }
}

hobo_preview_nat_gateway = {
  tags = {
    Name = "Preview NAT Gateway Name"
  }
}

hobo_preview_route_table_private_subnet = {
  tags = {
    Name = "Preview Route Table For Private Subnet"
  }
}

hobo_preview_route_nat_gateway = {
  destination_cidr_block = "0.0.0.0/0"
}

hobo_preview_security_group_cluster = {
  name = "Preview Cluster Security Group"
  description = "Security Group For Cluster"
  tags = {
    Name = "Preview Cluster Security Group"
  }
}

hobo_preview_cluster_ingress_rule = {
  cidr_blocks = ["113.160.19.218/32","118.70.133.189/32"]
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  description = "Allow workstation to communicate with API Server"
}

hobo_preview_cluster_egress_rule = {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  description = "Cluster communication with worker nodes"
}

hobo_preview_security_group_aurora = {
  name = "Preview Aurora Security Group"
  description = "Security Group For Aurora"
  tags = {
    Name  = "Preview Aurora Security Group"
  }
}

hobo_preview_aurora_ingress_rule = {
  from_port   = 3306
  to_port     = 3306
  protocol    = "tcp"
  cidr_blocks = ["10.0.0.0/16"]
  description = "Allow Aurora on port 3306"
}