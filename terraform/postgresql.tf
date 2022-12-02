resource "azurerm_postgresql_server" "wordle-psql" {
  name                = "wordle-psql"
  location            = azurerm_resource_group.WordleDiscordBot.location
  resource_group_name = azurerm_resource_group.WordleDiscordBot.name

  administrator_login          = "psqladmin"
  administrator_login_password = "invalidpwd"

  sku_name   = "GP_Gen5_1"
  version    = "11"
  storage_mb = 1000

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = false

  public_network_access_enabled    = false
  ssl_enforcement_enabled          = false
  ssl_minimal_tls_version_enforced = "TLS1_2"
}
