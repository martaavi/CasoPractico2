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
