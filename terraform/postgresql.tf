resource "azurerm_postgresql_flexible_server" "wordle-psql" {
  name                   = "wordle-psql"
  resource_group_name    = azurerm_resource_group.WordleDiscordBot.name
  location               = azurerm_resource_group.WordleDiscordBot.location
  version                = "14"
  delegated_subnet_id    = azurerm_subnet.WordlePSQLSub.id
  administrator_login    = "psqladmin"
  administrator_password = "invalidpwd"

  storage_mb = 32768

  sku_name   = "B_Standard_B1ms"
}
