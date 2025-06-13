resource "aws_s3_bucket" "this" {
  for_each = toset(var.regions)
  bucket = "rp-test-abc-${each.value}"
  provider = aws.by_region[each.value]
}