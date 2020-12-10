variable vpc_id {
  type        = string
}

variable name {
  type        = string
  default     = ""
  description = "Route Table name"
}

variable tags {
  type        = map(string)
  default     = {}
  description = "Route Table tags"
}

variable route_table_tags {
  type        = map(string)
  default     = {}
  description = "Additional Route Table tags"
}
