variable vpc {
  description = "Boolean if the EIP is in a VPC or not."
  type        = bool
  default     = true
}

variable instance {
  description = "EC2 instance ID."
  type        = string
  default     = ""
}

variable associate_with_private_ip {
  description = "Mapping eip to private ip"
  type        = string
  default     = ""
}

variable tags {
  description = "A map of tags to assign to the resource. Tags can only be applied to EIPs in a VPC."
  type        = map(string)
  default     = {}
}

variable name {
  description = "EIP's Name"
  type        = string
  default     = ""
}

variable eip_depends_on {
  type        = any
  default     = []
}