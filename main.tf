# Create a random name for naming the Resource Group
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

# Create a randomly named Resource Group
resource "azurerm_resource_group" "rg" {
  name     = random_pet.rg_name.id
  location = var.location
  tags = var.tags
}

# Create a random string for container1 naming
resource "random_string" "container_name1" {
  length  = 25
  lower   = true
  upper   = false
  special = false
}

# Create a random string for container2 naming
resource "random_string" "container_name2" {
  length  = 25
  lower   = true
  upper   = false
  special = false
}

# We need to create an identity for NGINXaaS 
# see: https://docs.nginx.com/nginxaas/azure/getting-started/managed-identity/
resource "azurerm_user_assigned_identity" "id_nginxaas" {
  location            = azurerm_resource_group.rg.location
  name                = "id_nginxaas"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}



