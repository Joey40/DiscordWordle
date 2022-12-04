resource "azurerm_postgresql_flexible_server" "wordle-psql" {
  name                   = "wordle-psql"
  resource_group_name    = azurerm_resource_group.WordleDiscordBot.name
  location               = azurerm_resource_group.WordleDiscordBot.location
  version                = "14"
  administrator_login    = "wordle"
  administrator_password = "wordle"
  zone                   = "2"

  storage_mb = 32768

  sku_name   = "B_Standard_B1ms"
}

resource "azurerm_postgresql_flexible_server_database" "wordle-psql-db" {
  name      = "wordle"
  server_id = azurerm_postgresql_flexible_server.wordle-psql.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "worlde-psql-fw" {
  for_each = toset(azurerm_linux_web_app.WordleBotApp.outbound_ip_address_list)
  
  name             = "Allow_BotWebApp_${each.key}"
  server_id        = azurerm_postgresql_flexible_server.wordle-psql.id
  start_ip_address = each.key
  end_ip_address   = each.key
}
