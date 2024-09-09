provider "azurerm" {
  features {}
  subscription_id = "b2631b33-28d9-4f16-83ff-dcffceb9bd41"
}

resource "random_string" "storage_account_name" {
  length  = 8
  upper   = false
  special = false
}

# variable "backend" {
#   type = object({
#     resourceGroupName = string
#     storageAccountName = string
#     containerName = string
#     stateFileName = string
#   })
  
# }

terraform {
  backend "azurerm" {}
}

resource "azurerm_storage_account" "example" {
  name                     = "st${random_string.storage_account_name.result}"
  resource_group_name      = "testlab"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  
  tags = {
    environment = "test"
  }
}

resource "azurerm_storage_account" "example2" {
  name                     = "st2${random_string.storage_account_name.result}"
  resource_group_name      = "testlab"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled = true
  
  tags = {
    environment = "test"
  }
}


resource "azurerm_storage_account" "example3" {
  name                     = "st3${random_string.storage_account_name.result}"
  resource_group_name      = "testlab"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled = true
  
  tags = {
    environment = "test"
  }
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name
}

output "storage_account_id" {
  value = azurerm_storage_account.example.id
}

output "storage_account_name2" {
  value = azurerm_storage_account.example2.name
}

output "storage_account_id2" {
  value = azurerm_storage_account.example2.id
}

