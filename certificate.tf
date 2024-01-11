data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                   = "kv-${random_pet.rg_name.id}"
  location               = var.location
  resource_group_name    = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "premium"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    certificate_permissions = [
      "Create",
      "Delete",
      "DeleteIssuers",
      "Get",
      "GetIssuers",
      "Import",
      "List",
      "ListIssuers",
      "ManageContacts",
      "ManageIssuers",
      "SetIssuers",
      "Update",
    ]
  }
  tags = var.tags
}

/*
resource "azurerm_key_vault_certificate" "demo-f5net-com" {
  name         = "demo-f5net-com-cert"
  key_vault_id = azurerm_key_vault.kv.id

  certificate {
    contents = filebase64("certificate-to-import.pfx")
    password = ""
  }
  tags = var.tags
}

resource "azurerm_nginx_certificate" "demo-f5net-com" {
  name                     = "democert"
  nginx_deployment_id      = azurerm_nginx_deployment.nginxaas-demo.id
  key_virtual_path         = "/srv/cert/soservermekey.key"
  certificate_virtual_path = "/srv/cert/server.cert"
  key_vault_secret_id      = azurerm_key_vault_certificate.demo-f5net-com.secret_id
}
*/