variable "region" {
  type = string
}

provider "aws" {
  region = var.region
}

resource "aws_guardduty_detector" "main" {
  enable = true
}

output "region" {
  value = var.region
}

output "detector_id" {
  value = aws_guardduty_detector.main.id
}
