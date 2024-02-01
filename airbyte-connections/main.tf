locals {
  data = jsondecode(file("${var.tenant_file}.json"))
  facebook_marketing_connectors = local.data.facebook_marketing
}