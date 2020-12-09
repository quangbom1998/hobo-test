variable security_group_id {
  description = "ID of Security Group"
  default     = ""
}

variable type {
  description = "The type of Ingress rules"
  type        = string
  default     = "ingress"
}

variable cidr_blocks {
  description = "The CIDR block for the subnet of Ingress rules"
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
  description = "Description of security group ingress rules"
  type        = string
  default     = ""
}