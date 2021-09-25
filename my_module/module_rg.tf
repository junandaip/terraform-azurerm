resource "azurerm_virtual_network" "myvnet" {
  name                = "my-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg_name

    tags = {
      Owner = "Junanda"
  }

}

output "vnet_id" {
  value = azurerm_virtual_network.myvnet.id
}

output "vnet_addresses" {
  value = azurerm_virtual_network.myvnet.address_space
}

output "vnet_location" {
  value = azurerm_virtual_network.myvnet.location
}