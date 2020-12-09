variable bucket {
  type        = string
  default     = ""
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name."
}

variable versioning_enabled {
  type        = bool
  default     = true
  description = "Enable versioning"
}

variable sse_algorithm {
  type        = string
  default     = "AES256"
  description = "The server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
}
