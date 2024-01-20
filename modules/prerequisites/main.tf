# Create a randomly named Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-${pf}"
  location = var.location
  tags = var.tags
}

# We need to create an identity for NGINXaaS 
# see: https://docs.nginx.com/nginxaas/azure/getting-started/managed-identity/
resource "azurerm_user_assigned_identity" "id_nginxaas" {
  location            = azurerm_resource_group.rg.location
  name                = "id_nginxaas"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}