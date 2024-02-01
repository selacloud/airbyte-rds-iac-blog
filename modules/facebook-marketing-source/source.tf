resource "airbyte_source_facebook_marketing" "facebook_marketing" {
  name         = "${var.name} ${var.env}"
  workspace_id = var.workspace_id
  configuration = {
    access_token                  = var.access_token
    account_id                    = var.account_id
    action_breakdowns_allow_empty = var.action_breakdowns_allow_empty
    custom_insights = [
      for custom_insight in var.custom_insights 
      : 
      {
        action_breakdowns = custom_insight.action_breakdowns
        breakdowns = custom_insight.breakdowns
        start_date = custom_insight.start_date
        end_date = custom_insight.end_date
        fields = custom_insight.fields
        insights_lookback_window = custom_insight.insights_lookback_window
        level = custom_insight.level
        name = custom_insight.name
        time_increment = custom_insight.time_increment
      }
    ]
    start_date               = var.start_date
    end_date                 = var.end_date
    fetch_thumbnail_images   = var.fetch_thumbnail_images
    include_deleted          = var.include_deleted
    insights_lookback_window = var.insights_lookback_window
    max_batch_size           = var.max_batch_size
    page_size                = var.page_size
    source_type              = "facebook-marketing"
  }
}