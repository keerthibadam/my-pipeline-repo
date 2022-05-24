variable "storageaccountname" {
    type=string
    default="sa002keerthi"
}
 
variable "resourcegroupname" {
    type=string
    default="terraformrg"
}

variable "location" {
    type=string
    default="North Europe"
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.5.0"
    }
  }
}

provider "azurerm"{
subscription_id = "40abcf56-f797-4608-a46e-34213244617b"
tenant_id       = "5f24ee50-e918-40e3-88bc-dd44ed4850df"
features {}
}
 
resource "azurerm_resource_group" "groups" {
  name     = var.resourcegroupname
  location = var.location
}
 
resource "azurerm_storage_account" "storage" {
  name                     = var.storageaccountname
  resource_group_name      = azurerm_resource_group.groups.name
  location                 = azurerm_resource_group.groups.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}