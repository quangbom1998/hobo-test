output s3_bucket_id {
  value       = module.hobo_test_s3_bucket.id
}

output dynamodb_table_id {
  value       = module.hobo_test_s3_dynamodb_table.id
}

