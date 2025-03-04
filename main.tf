terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"
    }  
  }
}


#Creo el service principal
  provider "azurerm" {
    features {}
    subscription_id = "e810b42d-1a34-478a-9e9b-3c73cde1571a"
    //client_id = ""
    //client_secret = ""
    //tenant_id = "899789dc-202f-44b4-8472-a6d40f9eb440"
  }

#Creo un grupo de recursos
  resource "azurerm_resource_group" "rg" {
    name     = "miResourceGroup"
    location = var.location

    tags = {
      environment = "CP2"
    }
  }

  #Creo el storage account
  resource "azurerm_storage_account" "stAccount" {
    name                      = "staccountcp2"
    resource_group_name       = azurerm_resource_group.rg.name
    location                  = azurerm_resource_group.rg.location
    account_tier              = "Standard"
    account_replication_type  = "LRS"

    tags = {
      environment = "CP2"
    }
  }

#Creo el Container Registry (ACR)
  resource "azurerm_container_registry" "acr" {
    name                = "miContainerRegistry"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    sku                 = "Basic"
    admin_enabled       = true
  }



