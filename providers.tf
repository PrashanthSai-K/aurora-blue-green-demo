terraform {
  required_version = ">= 1.0"
  required_providers {
    aurora-bluegreen = {
      source  = "local/aurora-bluegreen"
      version = "~> 1.0"
    }
  }
}

provider "aurora-bluegreen" {
  region = var.aws_region
  # Credentials from AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY env vars
  # or from the IAM role attached to the runner.
}
