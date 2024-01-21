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
| [azurerm_nginx_certificate.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nginx_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kv_secret_id"></a> [kv\_secret\_id](#input\_kv\_secret\_id) | The Key Vault Secrete ID for the example certificate | `string` | n/a | yes |
| <a name="input_nginxaas_deployment_id"></a> [nginxaas\_deployment\_id](#input\_nginxaas\_deployment\_id) | NGINXaaS deployment ID | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->