module "facebook_marketing_source" {
    for_each = local.facebook_marketing_connectors
    source = "../modules/facebook-marketing-source"   
    env = local.data.tenant.env
    name = each.value.name
    workspace_id = local.data.tenant.airbyte.workspace_id
    access_token = each.value.access_token
    account_id = each.value.account_id
    start_date = each.value.start_date
    # end_date = each.value.end_date
    # custom_insights = each.value.custom_insights
    action_breakdowns_allow_empty = each.value.action_breakdowns_allow_empty
    fetch_thumbnail_images = each.value.fetch_thumbnail_images
    include_deleted = each.value.include_deleted
    insights_lookback_window = each.value.insights_lookback_window
    max_batch_size = each.value.max_batch_size
    page_size = each.value.page_size

    providers = {
        airbyte = airbyte
    }
}