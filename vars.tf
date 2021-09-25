data "azurerm_resource_group" "rg_data" {
  name = "rgTest"

  depends_on = [
    azurerm_resource_group.rgTest
  ]
}