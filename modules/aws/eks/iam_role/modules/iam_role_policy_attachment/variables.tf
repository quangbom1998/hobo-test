variable policy_arn {
  type        = string
  default     = ""
  description = "The ARN of the policy you want to apply"
}

variable role {
  type        = string
  default     = ""
  description = "The role(s) the policy should be applied to"
}