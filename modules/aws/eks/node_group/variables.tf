variable cluster_name {
  type        = string
  default     = ""
  description = "Cluster's Name"
}

variable node_group_name {
  type        = string
  default     = ""
  description = "Node Group's name"
}

variable node_role_arn {
  type        = string
  default     = ""
  description = "Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group."
}

variable subnet_ids {
  type        = list(string)
  default     = []
  description = "Identifiers of EC2 Subnets to associate with the EKS Node Group. These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME (where CLUSTER_NAME is replaced with the name of the EKS Cluster)"
}

variable ami_type {
  type        = string
  default     = ""
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2_x86_64. Valid values: AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64"
}

variable disk_size {
  type        = number
  default     = 20
  description = "Disk size in GiB for worker nodes. Defaults to 20"
}

variable instance_types {
  type        = list(string)
  default     = []
  description = "Set of instance types associated with the EKS Node Group. Defaults to t3.medium"
}

variable ec2_ssh_key {
  type        = string
  default     = ""
  description = "ssh key"
}

variable desired_size {
  type        = number
  default     = 2
  description = "Desired number of EC2"
}

variable max_size {
  type        = number
  default     = 2
  description = "Max scaling number of EC2"
}

variable min_size {
  type        = number
  default     = 2
  description = "Min sacling number of EC2"
}

variable node_group_depends_on {
  type        = any
  default     = []
}