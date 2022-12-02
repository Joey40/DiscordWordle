resource "azurerm_virtual_network" "WordleNet" {
  name                = "WordleNet"
  location            = azurerm_resource_group.WordleDiscordBot.location
  resource_group_name = azurerm_resource_group.WordleDiscordBot.name
  address_space       = ["10.50.0.0/16"]
}
