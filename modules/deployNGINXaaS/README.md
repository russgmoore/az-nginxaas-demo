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
| [azurerm_nginx_deployment.nginxaas-demo](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nginx_deployment) | resource |
| [azurerm_role_assignment.nginxaas_monitering](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure Region objects are deployed into | `string` | n/a | yes |
| <a name="input_mypet"></a> [mypet](#input\_mypet) | A unique string appended to ojbect names | `string` | n/a | yes |
| <a name="input_nginx_frontend_public_ip_id"></a> [nginx\_frontend\_public\_ip\_id](#input\_nginx\_frontend\_public\_ip\_id) | ID of the NGINXaaS frontend public IP. | `string` | n/a | yes |
| <a name="input_nginx_subnet_id"></a> [nginx\_subnet\_id](#input\_nginx\_subnet\_id) | ID of the NGINXaaS Subnet. | `string` | n/a | yes |
| <a name="input_nginx_user_id"></a> [nginx\_user\_id](#input\_nginx\_user\_id) | Managed NGINXaas user identity | `string` | n/a | yes |
| <a name="input_nginxaas_principal_id"></a> [nginxaas\_principal\_id](#input\_nginxaas\_principal\_id) | Principal ID the NGINXaaS user identity. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group Name | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU of NGINXaaS deployment | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags used on objects created | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nginxaas_deployment_id"></a> [nginxaas\_deployment\_id](#output\_nginxaas\_deployment\_id) | The ID for our NGINXaaS deployment |
<!-- END_TF_DOCS -->