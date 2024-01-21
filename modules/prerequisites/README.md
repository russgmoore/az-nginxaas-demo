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
| [azurerm_network_interface.int_demo_app_1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface.int_demo_app_2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.sg_allowedin](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.pip_demo_app_1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_public_ip.pip_demo_app_2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_public_ip.pip_ngxaas](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_subnet.container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.nginx_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.sg_assoc](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_user_assigned_identity.id_nginxaas](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [azurerm_virtual_network.vnet_nginx](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure Region objects will be deployed into | `string` | n/a | yes |
| <a name="input_my_ip_address"></a> [my\_ip\_address](#input\_my\_ip\_address) | Source IP of your machine to allow access to resources during demonstrations | `string` | n/a | yes |
| <a name="input_mypet"></a> [mypet](#input\_mypet) | A unique string appended to ojbect names | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group Name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags used on objects created | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_subnet_id"></a> [container\_subnet\_id](#output\_container\_subnet\_id) | Subnet ID defined for Containers deployment |
| <a name="output_linux_demoapp1_interface_id"></a> [linux\_demoapp1\_interface\_id](#output\_linux\_demoapp1\_interface\_id) | Linux Demostration application 1 Interface ID |
| <a name="output_linux_demoapp2_interface_id"></a> [linux\_demoapp2\_interface\_id](#output\_linux\_demoapp2\_interface\_id) | Linux Demostration application 2 Interface ID |
| <a name="output_nginx_frontend_public_ip"></a> [nginx\_frontend\_public\_ip](#output\_nginx\_frontend\_public\_ip) | NGINXaaS public IP address. |
| <a name="output_nginx_frontend_public_ip_id"></a> [nginx\_frontend\_public\_ip\_id](#output\_nginx\_frontend\_public\_ip\_id) | ID of public IP address. |
| <a name="output_nginx_subnet_id"></a> [nginx\_subnet\_id](#output\_nginx\_subnet\_id) | The subnet ID delegated for the NGINXaaS deployment. |
| <a name="output_nginxaas_principal_id"></a> [nginxaas\_principal\_id](#output\_nginxaas\_principal\_id) | Principal ID the NGINXaaS user identity. |
| <a name="output_nginxaas_user_id"></a> [nginxaas\_user\_id](#output\_nginxaas\_user\_id) | Managed user identity for the NGINXaaS deployment |
<!-- END_TF_DOCS -->