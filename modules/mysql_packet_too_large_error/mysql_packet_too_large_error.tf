resource "shoreline_notebook" "mysql_packet_too_large_error" {
  name       = "mysql_packet_too_large_error"
  data       = file("${path.module}/data/mysql_packet_too_large_error.json")
  depends_on = [shoreline_action.invoke_update_mysql_config]
}

resource "shoreline_file" "update_mysql_config" {
  name             = "update_mysql_config"
  input_file       = "${path.module}/data/update_mysql_config.sh"
  md5              = filemd5("${path.module}/data/update_mysql_config.sh")
  description      = "Increase the "
  destination_path = "/agent/scripts/update_mysql_config.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_update_mysql_config" {
  name        = "invoke_update_mysql_config"
  description = "Increase the "
  command     = "`chmod +x /agent/scripts/update_mysql_config.sh && /agent/scripts/update_mysql_config.sh`"
  params      = ["NEW_PACKET_SIZE"]
  file_deps   = ["update_mysql_config"]
  enabled     = true
  depends_on  = [shoreline_file.update_mysql_config]
}

