provider "aws" {
  region = "us-east-1" # Default region
}

data "aws_regions" "current" {}

module "guardduty" {
  source   = "./guardduty"
  for_each = { for region in data.aws_regions.current.names : region => region }

  region = each.value
}

output "guardduty_detectors" {
  value = { for region, detector in module.guardduty : region => detector }
}
