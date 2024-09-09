provider "azurerm" {
  features {}
  subscription_id = "b2631b33-28d9-4f16-83ff-dcffceb9bd41"
}

resource "random_string" "storage_account_name" {
  length  = 8
  upper   = false
  special = false
}

resource "azurerm_storage_account" "example" {
  name                     = "st${random_string.storage_account_name.result}"
  resource_group_name      = "testlab"
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
