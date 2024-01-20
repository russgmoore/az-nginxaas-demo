resource "azurerm_nginx_deployment" "nginxaas-demo" {
  name                     = "nginxaas-${random_pet.pet.id}"
  resource_group_name      = azurerm_resource_group.rg.name
  sku                      = var.sku
  location                 = var.location
  diagnose_support_enabled = true

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.id_nginxaas.id]
  }

  frontend_public {
    ip_address = [azurerm_public_ip.pip_ngxaas.id]
  }
  network_interface {
    subnet_id = azurerm_subnet.nginx_subnet.id
  }

  tags = var.tags
}