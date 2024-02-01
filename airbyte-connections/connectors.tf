resource "airbyte_connection" "facebook_marketing" {
  for_each       = module.facebook_marketing_source
  name           = "${each.value.source_name} Facebook Marketing Connection ${local.data.tenant.name} ${local.data.tenant.env}"
  source_id      = each.value.source_id
  destination_id = airbyte_destination_mysql.my_destination_mysql.destination_id
  configurations = {
    streams = [ {
      name = "ads_insights"
      sync_mode = "incremental_append"
    } ]
  }
  schedule = {
    schedule_type = "manual"
  }
}