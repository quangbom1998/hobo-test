output hobo_staging_vpc_id {
  value       = module.hobo_staging_vpc.vpc_id
}

output hobo_staging_vpc_cidr {
  value       = module.hobo_staging_vpc.cidr_block
}

output hobo_staging_public_subnet_01_id {
  value       = module.hobo_staging_public_subnet_01.id
}

output hobo_staging_public_subnet_02_id {
  value       = module.hobo_staging_public_subnet_02.id
}

output hobo_staging_private_subnet_01_id {
  value       = module.hobo_staging_private_subnet_01.id
}

output hobo_staging_private_subnet_02_id {
  value       = module.hobo_staging_private_subnet_02.id
}

output hobo_staging_private_subnet_03_id {
  value       = module.hobo_staging_private_subnet_03.id
}

output hobo_staging_internet_gateway_id {
  value       = module.hobo_staging_internet_gateway.id
}

output hobo_staging_route_table_public_subnet_id {
  value       = module.hobo_staging_route_table_public_subnet.id
}

output hobo_staging_elastic_ip_id {
  value       = module.hobo_staging_elastic_ip.id
}

output hobo_staging_nat_gateway_id {
  value       = module.hobo_staging_nat_gateway.id
}

output hobo_staging_route_table_private_subnet_id {
  value       = module.hobo_staging_route_table_private_subnet.id
}

output hobo_staging_security_group_cluster_id {
  value       = module.hobo_staging_security_group_cluster.id
}

output hobo_staging_security_group_aurora_id {
  value       = module.hobo_staging_security_group_aurora.id
}
