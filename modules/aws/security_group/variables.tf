variable name {
  description = "Name of security group"
  type        = string
}

variable vpc_id {
  description = "ID of the VPC where to create security group"
  type        = string
}

variable description {
  description = "Description of security group"
  type        = string
  default     = "Security Group managed by Terraform"
}

variable tags {
  description = "A mapping of tags to assign to security group"
  type        = map(string)
  default     = {}
}