mock_provider "aws" {
  alias = "by_region"
}

variables {
  regions = [ "us-east-1"]
}

run "default" {
  assert {
    condition = aws_s3_bucket.this["us-east-1"].bucket == "rp-test-abc-us-east-1"
    error_message = "this should fail"
  }
}
