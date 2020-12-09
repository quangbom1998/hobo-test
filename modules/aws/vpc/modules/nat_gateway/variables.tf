variable allocation_id {
  type        = string
  default     = ""
  description = "The Allocation ID of the Elastic IP address for the gateway."
}

variable subnet_id {
  type        = string
  default     = ""
  description = " The Subnet ID of the subnet in which to place the gateway."
}

variable name {
  type        = string
  default     = ""
  description = "NAT Gateway Name"
}

variable tags {
  type        = map(string)
  default     = {}
  description = "NAT Gateway tags"
}

variable nat_gateway_depends_on {
  type        = any
  default     = []
}