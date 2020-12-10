variable vpc_id {
  type  = string
}

variable name {
  type        = string
  default     = ""
  description = "Internet Gateway Name"
}

variable tags {
  type        = map(string)
  default     = {}
  description = "Internet Gateway tags"
}