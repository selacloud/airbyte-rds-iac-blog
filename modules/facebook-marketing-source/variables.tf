variable "name" {
  type = string
}

variable "env" {
  type = string
}

variable "workspace_id" {
  type = string
}

variable "access_token" {
  type = string
}

variable "account_id" {
  type = string
}

variable "start_date" {
  type = string
  default = "2023-10-01T00:00:00Z"
}

variable "end_date" {
  type = string
}

variable "custom_insights" {
  type = list(object({
        action_breakdowns = list(string)
        breakdowns = list(string)
        start_date = string
        end_date = string
        fields = list(string)
        insights_lookback_window = string
        level = string
        name = string
        time_increment = string
      }))
}

variable "action_breakdowns_allow_empty" {
  type = bool
}

variable "fetch_thumbnail_images" {
  type = bool
}

variable "include_deleted" {
  type = bool
}

variable "insights_lookback_window" {
  type = number
}

variable "max_batch_size" {
  type = number
}

variable "page_size" {
  type = number
}