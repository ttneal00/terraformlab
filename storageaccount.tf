provider "azurerm" {
  features {}
}

resource "random_string" "storage_account_name" {
  length  = 8
  upper   = false
  special = false
}

resource "azurerm_resource_group" "example" {
  name     = "testlab"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "st${random_string.storage_account_name.result}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  tags = {
    environment = "test"
  }
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name
}
