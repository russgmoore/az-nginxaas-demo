resource "azurerm_nginx_certificate" "example" {
  name                     = "example-generated"
  nginx_deployment_id      = var.nginxaas_deployment_id
  key_virtual_path         = "/etc/nginx/ssl/test.key"
  certificate_virtual_path = "/etc/nginx/ssl/test.crt"
  key_vault_secret_id      = var.kv_secret_id
  
}