resource "azurerm_key_vault_certificate" "demo-f5net-com" {
  name         = "demo-f5net-com-cert"
  key_vault_id = azurerm_key_vault.keyvault.id

  certificate {
    contents = filebase64("certificate-to-import.pfx")
    password = ""
  }
  depends_on = [ azurerm_key_vault.keyvault ]
  tags = var.tags
}

resource "azurerm_nginx_certificate" "demo-f5net-com" {
  name                     = "democert"
  nginx_deployment_id      = azurerm_nginx_deployment.nginxaas-demo.id
  key_virtual_path         = "/srv/cert/soservermekey.key"
  certificate_virtual_path = "/srv/cert/server.cert"
  key_vault_secret_id      = azurerm_key_vault_certificate.demo-f5net-com.secret_id

  # - ensures deployment has role assignement to fetch certificate
  depends_on = [ azurerm_role_assignment.nginxaas-role ]

}

resource "azurerm_nginx_certificate" "example" {
  name                     = "example-generated"
  nginx_deployment_id      = azurerm_nginx_deployment.nginxaas-demo.id
  key_virtual_path         = "/etc/nginx/ssl/test.key"
  certificate_virtual_path = "/etc/nginx/ssl/test.crt"
  key_vault_secret_id      = azurerm_key_vault_certificate.example.secret_id
  
  # - ensures deployment has role assignement to fetch certificate
  depends_on = [ azurerm_role_assignment.nginxaas-role ]
}