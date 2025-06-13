provider "aws" {
  alias = "by_region"
  for_each = toset(var.regions)
  region   = each.value
}