data "azurerm_client_config" "current" {}

# This keyvault is NOT firewalled.
resource "azurerm_key_vault" "keyvault" {
  name                   = "keyvault-${var.mypet}"
  location               = var.location
  resource_group_name    = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  enable_rbac_authorization = true
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  sku_name = "standard"

  tags = var.tags
}

resource "azurerm_role_assignment" "current_user" {
  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_key_vault_certificate" "example" {
  name         = "examplecertificate"
  key_vault_id = azurerm_key_vault.keyvault.id

  certificate_policy {
    issuer_parameters {
      name = "Self"
    }

    key_properties {
      exportable = true
      key_size   = 2048
      key_type   = "RSA"
      reuse_key  = false
    }

    lifetime_action {
      action {
        action_type = "AutoRenew"
      }

      trigger {
        days_before_expiry = 30
      }
    }

    secret_properties {
      content_type = "application/x-pem-file"
    }

    x509_certificate_properties {
      extended_key_usage = [
        "1.3.6.1.5.5.7.3.1",
        "1.3.6.1.5.5.7.3.2"
      ]

      key_usage = [
        "cRLSign",
        "dataEncipherment",
        "digitalSignature",
        "keyAgreement",
        "keyCertSign",
        "keyEncipherment",
      ]

      subject            = "CN=example.com"
      validity_in_months = 12
    }
  }
  depends_on = [azurerm_role_assignment.current_user]
  tags = var.tags
}

resource "azurerm_role_assignment" "nginxaas-role" {
  scope                = azurerm_key_vault.keyvault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.nginxaas_principal_id

}
