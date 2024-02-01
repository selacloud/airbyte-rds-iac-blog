terraform {
  backend "s3" {
    region = "us-east-2"
  }
  required_providers {
    airbyte = {
      source = "airbytehq/airbyte"
      version = "0.3.4"
    }
  }
}