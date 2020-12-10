module "hobo_test_s3_bucket" {
  source             = "../../modules/aws/s3"

  bucket             = lookup(var.hobo_test_s3_bucket, "bucket")

  # Enable versioning so we can see the full revision history of our state files
  # block versioning {}
  versioning_enabled = lookup(var.hobo_test_s3_bucket, "versioning_enabled")
  
  # Enable server-side encryption by default
  # block server_side_encryption_configuration{ rule { apply_server_side_encryption_by_default {} } }
  sse_algorithm      = lookup(var.hobo_test_s3_bucket, "sse_algorithm")
}


#We need to create DynamoDB table that will create a lock, so that two developer doesn’t update same resource simultaneously in Terraform.
module "hobo_test_s3_dynamodb_table" {
  source             = "../../modules/aws/s3/modules/dynamodb"

  name               = lookup(var.hobo_test_s3_dynamodb_table, "name")
  billing_mode       = lookup(var.hobo_test_s3_dynamodb_table, "billing_mode")
  hash_key           = lookup(var.hobo_test_s3_dynamodb_table, "hash_key")

  # block attribute
  attribute_name     = lookup(var.hobo_test_s3_dynamodb_table, "attribute_name")
  attribute_type     = lookup(var.hobo_test_s3_dynamodb_table, "attribute_type")
}

# Uncomment below code and run 'terraform init' after create s3 bucket
terraform {
  backend "s3" {
    #bucket name
    bucket         = "vn-hobo-test-state-bucket"
    key            = "hobo-test/terraform/s3/terraform.tfstate"
    region         = "ap-northeast-1"

    #DynamoDB table name!
    dynamodb_table = "vn-hobo-test-state-locks"
    encrypt        = true
  }
}