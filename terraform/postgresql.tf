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

resource "azurerm_postgresql_database" "wordle-psql-db" {
  name                = "wordle"
  resource_group_name = azurerm_resource_group.WordleDiscordBot.name
  server_name         = azurerm_postgresql_server.wordle-psql.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
