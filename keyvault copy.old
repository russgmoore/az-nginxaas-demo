data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                   = "keyvaultnginxaas"
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

resource "azurerm_key_vault_access_policy" "keyvault-policy1" {
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = azurerm_user_assigned_identity.id_nginxaas.principal_id

  key_permissions = [ "Get",]
  secret_permissions = [ "Get",]
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