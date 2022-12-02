resource "azurerm_virtual_network" "WordleNet" {
  name                = "WordleNet"
  location            = azurerm_resource_group.WordleDiscordBot.location
  resource_group_name = azurerm_resource_group.WordleDiscordBot.name
  address_space       = ["10.50.0.0/16"]
}

resource "azurerm_subnet" "WordlePSQLSub" {
  name                 = "WordlePSQLSub"
  resource_group_name  = azurerm_resource_group.WordleDiscordBot.name
  virtual_network_name = azurerm_virtual_network.WordleDiscordBot.name
  address_prefixes     = ["10.50.1.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}
