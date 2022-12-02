resource "azurerm_app_service_plan" "WordleBotASP" {
  name                = "WordleBotASP"
  location            = azurerm_resource_group.WordleDiscordBot.location
  resource_group_name = azurerm_resource_group.WordleDiscordBot.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}
