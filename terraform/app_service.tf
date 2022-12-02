resource "azurerm_service_plan" "WordleBotASP" {
  name                = "WordleBotASP"
  location            = azurerm_resource_group.WordleDiscordBot.location
  resource_group_name = azurerm_resource_group.WordleDiscordBot.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "WordleBotApp" {
  name                = "WordleBotApp"
  resource_group_name = azurerm_resource_group.WordleDiscordBot.name
  location            = azurerm_resource_group.WordleDiscordBot.location
  service_plan_id     = azurerm_service_plan.WordleBotASP.id

  site_config {
    always_on = true
    application_stack {
      go = "1.18"
  }
}
