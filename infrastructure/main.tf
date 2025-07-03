provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-hybrid-a09"
  location = "East US"
}
