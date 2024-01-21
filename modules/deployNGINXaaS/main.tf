resource "azurerm_nginx_deployment" "nginxaas-demo" {
  name                     = "nginxaas-${var.mypet}"
  resource_group_name      = var.resource_group_name
  sku                      = var.sku
  location                 = var.location
  diagnose_support_enabled = true

  identity {
    type         = "UserAssigned"
    identity_ids = [var.nginx_user_id]
  }

  frontend_public {
    ip_address = [var.nginx_frontend_public_ip_id]
  }
  network_interface {
    subnet_id = var.nginx_subnet_id
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "nginxaas_monitering" {
  scope                      = azurerm_nginx_deployment.nginxaas-demo.id
  role_definition_name       = "Monitoring Metrics Publisher"
  principal_id               = var.nginxaas_principal_id
}