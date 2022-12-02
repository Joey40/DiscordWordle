resource "azurerm_service_plan" "WordleBotASP" {
  name                = "WordleBotASP"
  location            = azurerm_resource_group.WordleDiscordBot.location
  resource_group_name = azurerm_resource_group.WordleDiscordBot.name
  os_type             = "Linux"
  sku_name            = B1
}
