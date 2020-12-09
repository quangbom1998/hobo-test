variable vpc_id {
  type = string
}

variable availability_zone {
  type        = string
  default     = ""
  description = "AZ"
}

variable cidr_block {
  type        = string
  default     = ""
  description = "Subnet cidr"
}

variable map_public_ip_on_launch {
  type        = bool
  default     = false
  description = "ec2 launch in this subnet get public ip if type is true"
}

variable name {
  type        = string
  default     = ""
  description = "Private Subnet Name"
}

variable tags {
  type        = map(string)
  default     = {}
  description = "Subnet tags"
}

