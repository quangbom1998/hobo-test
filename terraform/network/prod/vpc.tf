##################
# Remote Backend #
##################
terraform {
  backend "s3" {
    #bucket name
    bucket         = "vn-hobo-test-state-bucket"
    key            = "hobo-test/terraform/network/prod/terraform.tfstate"
    region         = "ap-northeast-1"

    #DynamoDB table name
    dynamodb_table = "vn-hobo-test-state-locks"
    encrypt        = true
  }
}

############
# Prod VPC #
############
module "hobo_prod_vpc" {
  source                  = "../../../modules/aws/vpc"

  cidr                    = lookup(var.hobo_prod_vpc, "cidr")
  instance_tenancy        = lookup(var.hobo_prod_vpc, "instance_tenancy")
  enable_dns_hostnames    = lookup(var.hobo_prod_vpc, "enable_dns_hostnames")
  tags                    = lookup(var.hobo_prod_vpc, "tags") 
}

#################
# Public Subnet #
#################
module "hobo_prod_public_subnet_01" {
  source                  = "../../../modules/aws/vpc/modules/subnets"

  vpc_id                  = module.hobo_prod_vpc.vpc_id
  cidr_block              = lookup(var.hobo_prod_public_subnet_01, "cidr")
  map_public_ip_on_launch = lookup(var.hobo_prod_public_subnet_01, "map_public_ip_on_launch")
  tags                    = lookup(var.hobo_prod_public_subnet_01, "tags")
}

module "hobo_prod_public_subnet_02" {
  source                  = "../../../modules/aws/vpc/modules/subnets"

  vpc_id                  = module.hobo_prod_vpc.vpc_id
  cidr_block              = lookup(var.hobo_prod_public_subnet_02, "cidr")
  map_public_ip_on_launch = lookup(var.hobo_prod_public_subnet_02, "map_public_ip_on_launch")
  tags                    = lookup(var.hobo_prod_public_subnet_02, "tags")
}

##################
# Private Subnet #
##################
module "hobo_prod_private_subnet_01" {
  source                  = "../../../modules/aws/vpc/modules/subnets"

  vpc_id                  = module.hobo_prod_vpc.vpc_id
  availability_zone       = lookup(var.hobo_prod_private_subnet_01, "availability_zone")
  cidr_block              = lookup(var.hobo_prod_private_subnet_01, "cidr")
  map_public_ip_on_launch = lookup(var.hobo_prod_private_subnet_01, "map_public_ip_on_launch")
  tags                    = lookup(var.hobo_prod_private_subnet_01, "tags")
}

module "hobo_prod_private_subnet_02" {
  source                  = "../../../modules/aws/vpc/modules/subnets"

  vpc_id                  = module.hobo_prod_vpc.vpc_id
  availability_zone       = lookup(var.hobo_prod_private_subnet_02, "availability_zone")
  cidr_block              = lookup(var.hobo_prod_private_subnet_02, "cidr")
  map_public_ip_on_launch = lookup(var.hobo_prod_private_subnet_02, "map_public_ip_on_launch")
  tags                    = lookup(var.hobo_prod_private_subnet_02, "tags")
}

####################
# Internet Gateway #
####################
module "hobo_prod_internet_gateway" {
  source                  = "../../../modules/aws/vpc/modules/internet_gateway"

  vpc_id                  = module.hobo_prod_vpc.vpc_id
  tags                    = lookup(var.hobo_prod_internet_gateway, "tags")
}

#####################################################
# Route Table For Public Subnet To Internet Gateway #
#####################################################
module "hobo_prod_route_table_public_subnet" {
  source                  = "../../../modules/aws/route_table"

  vpc_id                  = module.hobo_prod_vpc.vpc_id
  tags                    = lookup(var.hobo_prod_route_table_public_subnet, "tags")
}

#############################
# Route To Internet Gateway #
#############################
module "hobo_prod_route_internet_gateway" {
  source                  = "../../../modules/aws/route_table/modules/route"

  route_table_id          = module.hobo_prod_route_table_public_subnet.id
  destination_cidr_block  = lookup(var.hobo_prod_route_internet_gateway, "destination_cidr_block")
  gateway_id              = module.hobo_prod_internet_gateway.id
}

##############################################################
# Route Table Association (Internet Gateway & Public Subnet) #
##############################################################
module "hobo_prod_route_table_association_public_subnet_01" {
  source                  = "../../../modules/aws/route_table/modules/route_table_association"
  
  subnet_id               = module.hobo_prod_public_subnet_01.id
  route_table_id          = module.hobo_prod_route_table_public_subnet.id
}

module "hobo_prod_route_table_association_public_subnet_02" {
  source                  = "../../../modules/aws/route_table/modules/route_table_association"
  
  subnet_id               = module.hobo_prod_public_subnet_02.id
  route_table_id          = module.hobo_prod_route_table_public_subnet.id
}

##############################
# Elastic IP For NAT Gateway #
##############################
module "hobo_prod_elastic_ip" {
  source                  = "../../../modules/aws/vpc/modules/elastic_ip"

  vpc                     = lookup(var.hobo_prod_elastic_ip, "vpc")
  tags                    = lookup(var.hobo_prod_elastic_ip, "tags")
  
  depends_on              = [module.hobo_prod_internet_gateway]
}

###############
# NAT Gateway #
###############
module "hobo_prod_nat_gateway" {
  source                  = "../../../modules/aws/vpc/modules/nat_gateway"

  allocation_id           = module.hobo_prod_elastic_ip.id
  subnet_id               = module.hobo_prod_public_subnet_01.id
  tags                    = lookup(var.hobo_prod_nat_gateway, "tags")

  depends_on              = [module.hobo_prod_internet_gateway]
}

#################################################
# Route Table For Private Subnet To NAT Gateway #
#################################################
module "hobo_prod_route_table_private_subnet" {
  source                  = "../../../modules/aws/route_table"

  vpc_id                  = module.hobo_prod_vpc.vpc_id
  tags                    = lookup(var.hobo_prod_route_table_private_subnet, "tags")
}

########################
# Route To NAT Gateway #
########################
module "hobo_prod_route_nat_gateway" {
  source                  = "../../../modules/aws/route_table/modules/route"

  route_table_id          = module.hobo_prod_route_table_private_subnet.id
  destination_cidr_block  = lookup(var.hobo_prod_route_nat_gateway, "destination_cidr_block")
  nat_gateway_id          = module.hobo_prod_nat_gateway.id
}

##########################################################
# Route Table Association (NAT Gateway & Private Subnet) #
##########################################################
module "hobo_prod_route_table_association_nat_gateway_private_subnet_01" {
  source                  = "../../../modules/aws/route_table/modules/route_table_association"
  
  subnet_id               = module.hobo_prod_private_subnet_01.id
  route_table_id          = module.hobo_prod_route_table_private_subnet.id
}

##############################
# Security Group For Cluster #
##############################
module "hobo_prod_security_group_cluster" {
  source                  = "../../../modules/aws/security_group"

  vpc_id                  = module.hobo_prod_vpc.vpc_id
  name                    = lookup(var.hobo_prod_security_group_cluster, "name")
  description             = lookup(var.hobo_prod_security_group_cluster, "description")
  tags                    = lookup(var.hobo_prod_security_group_cluster, "tags")
}

################
# Ingress Rule #
################
module "hobo_prod_cluster_ingress_rule" {
  source                  = "../../../modules/aws/security_group/modules/ingress_rules"

  security_group_id       = module.hobo_prod_security_group_cluster.id
  cidr_blocks             = lookup(var.hobo_prod_cluster_ingress_rule, "cidr_blocks")
  from_port               = lookup(var.hobo_prod_cluster_ingress_rule, "from_port")
  to_port                 = lookup(var.hobo_prod_cluster_ingress_rule, "to_port")
  protocol                = lookup(var.hobo_prod_cluster_ingress_rule, "protocol")
  description             = lookup(var.hobo_prod_cluster_ingress_rule, "description")
}

###############
# Egress Rule #
###############
module "hobo_prod_cluster_egress_rule" {
  source                  = "../../../modules/aws/security_group/modules/egress_rules"

  security_group_id       = module.hobo_prod_security_group_cluster.id
  cidr_blocks             = lookup(var.hobo_prod_cluster_egress_rule, "cidr_blocks")
  from_port               = lookup(var.hobo_prod_cluster_egress_rule, "from_port")
  to_port                 = lookup(var.hobo_prod_cluster_egress_rule, "to_port")
  protocol                = lookup(var.hobo_prod_cluster_egress_rule, "protocol")
  description             = lookup(var.hobo_prod_cluster_egress_rule, "description")
}

#############################
# Security Group For Aurora #
############################# 
module "hobo_prod_security_group_aurora" {
  source                  = "../../../modules/aws/security_group"
  name                    = lookup(var.hobo_prod_security_group_aurora, "name")
  description             = lookup(var.hobo_prod_security_group_aurora, "description")
  vpc_id                  = module.hobo_prod_vpc.vpc_id

  tags                    = lookup(var.hobo_prod_security_group_aurora, "tags")
}

###########################
# Ingress Rule For Aurora #
###########################
module "hobo_prod_aurora_ingress_rule" {
  source                  = "../../../modules/aws/security_group/modules/ingress_rules"

  security_group_id       = module.hobo_prod_security_group_cluster.id
  cidr_blocks             = lookup(var.hobo_prod_aurora_ingress_rule, "cidr_blocks")
  from_port               = lookup(var.hobo_prod_aurora_ingress_rule, "from_port")
  to_port                 = lookup(var.hobo_prod_aurora_ingress_rule, "to_port")
  protocol                = lookup(var.hobo_prod_aurora_ingress_rule, "protocol")
  description             = lookup(var.hobo_prod_aurora_ingress_rule, "description")
}