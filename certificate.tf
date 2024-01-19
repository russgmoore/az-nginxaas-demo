# define the certificate in NGINXaaS
resource "azurerm_nginx_certificate" "example" {
  name                     = "example-generated"
  nginx_deployment_id      = azurerm_nginx_deployment.nginxaas-demo.id
  key_virtual_path         = "/etc/nginx/ssl/test.key"
  certificate_virtual_path = "/etc/nginx/ssl/test.crt"
  key_vault_secret_id      = azurerm_key_vault_certificate.example.secret_id
  
  # - ensures deployment has role assignement to fetch certificate
  depends_on = [ azurerm_role_assignment.nginxaas-role ]
}