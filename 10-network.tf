resource "azurerm_virtual_network" "vnetwork" {
  name                = "my-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.arg.location
  resource_group_name = azurerm_resource_group.arg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.arg.name
  virtual_network_name = azurerm_virtual_network.vnetwork.name
  address_prefixes     = ["10.0.2.0/24"]
}
