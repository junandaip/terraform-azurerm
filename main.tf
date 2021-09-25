# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rgTest" {
  name = "rgTest"
  location = "southeastasia"

  tags = {
    "Owner" = "Junanda"
  }

}

module "my_rg_module" {
  source = "./my_module"
  location = data.azurerm_resource_group.rg_data.location
  rg_name = data.azurerm_resource_group.rg_data.name
}

output "resource_group_data_id" {
  value       = data.azurerm_resource_group.rg_data.id
  description = "The ID of the selected resource group"
}

output "resource_group_tags" {
  value       = data.azurerm_resource_group.rg_data.tags
  description = "Tags that belongs to the selected resource group"
}

output "virtual_network_id" {
  value       = module.my_rg_module.vnet_id
  description = "The ID of the selected virtual network"
}

output "virtual_network_addreses" {
  value       = module.my_rg_module.vnet_addresses
  description = "The address space of the selected virtual network"
}

output "virtual_network_location" {
  value       = module.my_rg_module.vnet_location
  description = "The location of the selected virtual network"
}