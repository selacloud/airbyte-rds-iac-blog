provider "aws" {
    profile = var.profile
    region  = var.region
}

provider "airbyte" {
  username   = local.data.tenant.airbyte.username
  password   = local.data.tenant.airbyte.password
  server_url = local.data.tenant.airbyte.server_url
}