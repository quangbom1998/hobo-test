variable security_group_id {
  description = "ID of Security Group"
  default     = ""
}

variable type {
  description = "The type of Egress rules"
  type        = string
  default     = "egress"
}

variable cidr_blocks {
  description = "The CIDR block for the subnet of Egress rules"
  type        = list(string)
  default     = []
}

variable from_port {
  description = "Number of source port"
  type        = number
  default     = 0
}

variable to_port {
  description = "Number of destination port"
  type        = number
  default     = 0
}

variable protocol {
  description = "Protocol connection"
  type        = string
  default     = "tcp"
}

variable description {
  type        = string
  default     = ""
  description = "Egress Rule"
}
