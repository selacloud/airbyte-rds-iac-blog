resource "airbyte_destination_mysql" "my_destination_mysql" {
  configuration = {
    database         = local.data.tenant.destination.db_name
    destination_type = "mysql"
    host             = local.data.tenant.destination.db_host
    username         = local.data.tenant.destination.db_username
    password         = local.data.tenant.destination.db_pw
    port             = local.data.tenant.destination.db_port
    tunnel_method = {
      destination_mysql_ssh_tunnel_method_no_tunnel = {
        tunnel_method = "NO_TUNNEL"
      }
    }
  }
  name         = "MySQL DB Destination ${local.data.tenant.env}"
  workspace_id = local.data.tenant.airbyte.workspace_id
}