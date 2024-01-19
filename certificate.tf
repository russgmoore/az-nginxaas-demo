resource "azurerm_key_vault_certificate" "demo-f5net-com" {
  name         = "demo-f5net-com-cert"
  key_vault_id = azurerm_key_vault.keyvault.id

  certificate {
    contents = filebase64("certificate-to-import.pfx")
    password = ""
  }
  tags = var.tags
}
/*
resource "azurerm_nginx_certificate" "demo-f5net-com" {
  name                     = "democert"
  nginx_deployment_id      = azurerm_nginx_deployment.nginxaas-demo.id
  key_virtual_path         = "/srv/cert/soservermekey.key"
  certificate_virtual_path = "/srv/cert/server.cert"
  key_vault_secret_id      = azurerm_key_vault_certificate.demo-f5net-com.secret_id
}
*/