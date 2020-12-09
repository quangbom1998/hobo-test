variable ami {
  type        = string
  default     = ""
  description = "The AMI to use for the instance."
}

variable instance_type {
  type        = string
  default     = "t2.micro"
  description = "The type of instance to start. "
}

variable key_name {
  type        = string
  default     = ""
  description = "The key name of the Key Pair to use for the instance"
}

variable vpc_security_group_ids {
  type        = list(string)
  default     = []
  description = "A list of security group IDs to associate with."
}

variable subnet_id {
  type        = string
  default     = ""
  description = " The VPC Subnet ID to launch in."
}

variable tags {
  type        = map(string)
  default     = {}
  description = "A map of tags to assign to the resource"
}
