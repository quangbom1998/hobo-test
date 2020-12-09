variable route_table_id {
  type        = string
}

variable destination_cidr_block {
  type        = string
  default     = ""
  description = "Cidr"
}

variable gateway_id {
  type        = string
  default     = ""
  description = "Gateway id"
}

variable nat_gateway_id {
  type        = string
  default     = ""
  description = "Natgateway id"
}

variable vpc_peering_connection_id {
  type        = string
  default     = ""
  description = "Peering Connection id"
}
