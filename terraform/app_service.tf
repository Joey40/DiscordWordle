resource "azurerm_service_plan" "WordleBotASP" {
  name                = "WordleBotASP"
  location            = azurerm_resource_group.WordleDiscordBot.location
  resource_group_name = azurerm_resource_group.WordleDiscordBot.name
  os_type             = "Windows"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "WordleBotApp" {
  name                = "WordleBotApp"
  resource_group_name = azurerm_resource_group.WordleDiscordBot.name
  location            = azurerm_resource_group.WordleDiscordBot.location
  service_plan_id     = azurerm_service_plan.WordleBotASP.id

  site_config {
    always_on = true
  }
  
  app_settings = {
    "DATABASE_URL" = "postgres://wordle:wordle@${azurerm_postgresql_flexible_server.wordle-psql.fqdn}:5432/wordle?sslmode=disable"
    "DISCORD_TOKEN" = "ChangeMe"
  }
  
  lifecycle {
    ignore_changes = [
      app_settings["DISCORD_TOKEN"],
    ]
  }
  
}
