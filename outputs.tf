output "resource_group_name" {
  description = "Nombre del grupo de recursos creado."
  value       = azurerm_resource_group.rg.name
}

output "storage_account_blob_endpoint" {
  description = "Endpoint principal del Storage Account para blobs."
  value       = azurerm_storage_account.stAccount.primary_blob_endpoint
}

output "aks_cluster_name" {
  description = "Nombre del cluster AKS desplegado."
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_kube_admin_config_raw" {
  description = "Configuración de administrador (raw) para acceder al cluster AKS."
  value       = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
  sensitive   = true
}

output "acr_login_server" {
  description = "Servidor de login del Azure Container Registry (ACR)."
  value       = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  description = "Nombre de usuario administrador del ACR."
  value       = azurerm_container_registry.acr.admin_username
  sensitive   = true
}

output "acr_admin_password" {
  description = "Contraseña del administrador del ACR."
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}
