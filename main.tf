
resource "azurerm_resource_group" "rg" {
  name     = var.azure_rg1
  location = var.location
  tags     = var.tags
}

resource "azurerm_user_assigned_identity" "id-nginxaas" {
  location            = azurerm_resource_group.rg.location
  name                = "id-nginxaas"
  resource_group_name = azurerm_resource_group.rg.name

  tags = var.tags
}

