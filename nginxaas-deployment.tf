resource "azurerm_nginx_deployment" "nginxaas-demo" {
  name                     = "nginxaas-demo"
  resource_group_name      = azurerm_resource_group.rg.name
  sku                      = var.sku
  location                 = var.location
  diagnose_support_enabled = true

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.id-nginxaas.id]
  }

  frontend_public {
    ip_address = [azurerm_public_ip.pip-ngxaas.id]
  }
  network_interface {
    subnet_id = azurerm_subnet.nginx-subnet.id
  }

  tags = var.tags
}
resource "azurerm_nginx_configuration" "nginxaas-config" {
  nginx_deployment_id = azurerm_nginx_deployment.nginxaas-demo.id
  root_file           = "/etc/nginx/nginx.conf"

  config_file {
    content      = filebase64("${path.module}/nginx.conf")
    virtual_path = "/etc/nginx/nginx.conf"
  }

  config_file {
    content      = filebase64("${path.module}/api.conf")
    virtual_path = "/etc/nginx/site/api.conf"
  }
}
