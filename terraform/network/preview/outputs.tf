output hobo_preview_vpc_id {
  value       = module.hobo_preview_vpc.vpc_id
}

output hobo_preview_vpc_cidr {
  value       = module.hobo_preview_vpc.cidr_block
}

output hobo_preview_public_subnet_01_id {
  value       = module.hobo_preview_public_subnet_01.id
}

output hobo_preview_public_subnet_02_id {
  value       = module.hobo_preview_public_subnet_02.id
}

output hobo_preview_private_subnet_01_id {
  value       = module.hobo_preview_private_subnet_01.id
}

output hobo_preview_private_subnet_02_id {
  value       = module.hobo_preview_private_subnet_02.id
}

output hobo_preview_private_subnet_03_id {
  value       = module.hobo_preview_private_subnet_03.id
}

output hobo_preview_internet_gateway_id {
  value       = module.hobo_preview_internet_gateway.id
}

output hobo_preview_route_table_public_subnet_id {
  value       = module.hobo_preview_route_table_public_subnet.id
}

output hobo_preview_elastic_ip_id {
  value       = module.hobo_preview_elastic_ip.id
}

output hobo_preview_nat_gateway_id {
  value       = module.hobo_preview_nat_gateway.id
}

output hobo_preview_route_table_private_subnet_id {
  value       = module.hobo_preview_route_table_private_subnet.id
}

output hobo_preview_security_group_cluster_id {
  value       = module.hobo_preview_security_group_cluster.id
}

output hobo_preview_security_group_aurora_id {
  value       = module.hobo_preview_security_group_aurora.id
}
