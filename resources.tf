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
    location                  = var.location
    account_tier              = "Standard"
    account_replication_type  = "LRS"

    tags = {
      environment = "CP2"
    }
  }

#Creo el AKS
resource "azurerm_kubernetes_cluster" "aks" {
    name                = "miAKS"
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    dns_prefix = var.dns_aks

    default_node_pool {
      name = "default"
      node_count = 1
      vm_size = var.vm_size
    }

    identity {
      type = "SystemAssigned"
    }

    tags = {
      environment = "CP2"
    }
  }

#Creo el Container Registry (ACR)
  resource "azurerm_container_registry" "acr" {
    name                = "miContainerRegistry"
    resource_group_name = azurerm_resource_group.rg.name
    location            = var.location
    sku                 = "Basic"
    admin_enabled       = true

    tags = {
      environment = "CP2"
    }
  }

  resource "azurerm_role_assignment" "ra-perm" {
    principal_id                        = azurerm_kubernetes_cluster.aks.identity[0].principal_id
    role_definition_name                = "AcrPull"
    scope                               = azurerm_container_registry.acr.id
  }




