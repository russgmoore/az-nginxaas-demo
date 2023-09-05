
# Create a resource group to place everything into
resource "azurerm_resource_group" "rg" {
  # the resource group name is defined in the terraform.tfvars pick something unique!
  name     = var.azure_rg1
  # the Azure location is defined in the terraform.tfvars pick something close
  location = var.location
  # the tags used on all resources are, you guessed it, defined in the terraform.tfvars file
  tags     = var.tags
}

# We need to create an identity for NGINXaaS 
# see: https://docs.nginx.com/nginxaas/azure/getting-started/managed-identity/
resource "azurerm_user_assigned_identity" "id-nginxaas" {
  location            = azurerm_resource_group.rg.location
  name                = "id-nginxaas"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

