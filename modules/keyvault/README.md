<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.keyvault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_certificate.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_certificate) | resource |
| [azurerm_role_assignment.current_user](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.nginxaas-role](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure Region objects are deployed into | `string` | n/a | yes |
| <a name="input_mypet"></a> [mypet](#input\_mypet) | A unique string appended to ojbect names | `string` | n/a | yes |
| <a name="input_nginxaas_principal_id"></a> [nginxaas\_principal\_id](#input\_nginxaas\_principal\_id) | Principal ID the NGINXaaS user identity. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group Name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags used on objects created | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kv_secret_id_example"></a> [kv\_secret\_id\_example](#output\_kv\_secret\_id\_example) | The keyvault secret ID for the example certificate |
<!-- END_TF_DOCS -->