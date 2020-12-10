resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket
  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = var.versioning_enabled
  }
  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }
}