####################
# For providers.tf #
####################
aws_region                  = "ap-northeast-1"
aws_shared_credentials_file = "~/.aws/credentials"

###############
# For main.tf #
###############
hobo_test_s3_bucket = {
  bucket             = "vn-hobo-test-state-bucket"
  versioning_enabled = true
  sse_algorithm      = "AES256"
}

hobo_test_s3_dynamodb_table = {
  name           = "vn-hobo-test-state-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  
  attribute_name = "LockID"
  attribute_type = "S"
}