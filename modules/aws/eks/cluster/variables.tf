variable name {
  type        = string
  default     = ""
  description = "Cluster's name"
}

variable role_arn {
  type        = string
  default     = ""
  description = "ARN of the IAM role that provides permissions for K8s control plane to make call to AWS API"
}

variable security_group_ids {
  type        = list(string)
  default     = []
  description = "Id of security group"
}

variable subnet_ids {
  type        = list(string)
  default     = []
  description = "Subnet for cluster"
}

variable cluster_depends_on {
  type        = any
  default     = []
}

