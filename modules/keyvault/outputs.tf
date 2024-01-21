output "kv_secret_id_example" {
  description = "The keyvault secret ID for the example certificate"
  value = azurerm_key_vault_certificate.example.secret_id
}
