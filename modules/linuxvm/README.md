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
| [azurerm_linux_virtual_machine.linuxapp-1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_linux_virtual_machine.linuxapp-2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_size"></a> [instance\_size](#input\_instance\_size) | Azure Linux VM instance size | `string` | n/a | yes |
| <a name="input_linux_demoapp1_interface_id"></a> [linux\_demoapp1\_interface\_id](#input\_linux\_demoapp1\_interface\_id) | Linux Demostration application 1 Interface ID | `string` | n/a | yes |
| <a name="input_linux_demoapp2_interface_id"></a> [linux\_demoapp2\_interface\_id](#input\_linux\_demoapp2\_interface\_id) | Linux Demostration application 2 Interface ID | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure Region used for deployed objects | `string` | n/a | yes |
| <a name="input_mypet"></a> [mypet](#input\_mypet) | A unique string appended to ojbect names | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group Name | `string` | n/a | yes |
| <a name="input_ssh_key_file"></a> [ssh\_key\_file](#input\_ssh\_key\_file) | File where existing SSH key is used for loading on instance | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags used on objects created | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_linux_demoapp1_private_ip"></a> [linux\_demoapp1\_private\_ip](#output\_linux\_demoapp1\_private\_ip) | Linux Demostration application 1 private IP address |
| <a name="output_linux_demoapp1_public_ip"></a> [linux\_demoapp1\_public\_ip](#output\_linux\_demoapp1\_public\_ip) | Linux Demostration application 1 public IP address |
| <a name="output_linux_demoapp2_private_ip"></a> [linux\_demoapp2\_private\_ip](#output\_linux\_demoapp2\_private\_ip) | Linux Demostration application 2 private IP address |
| <a name="output_linux_demoapp2_public_ip"></a> [linux\_demoapp2\_public\_ip](#output\_linux\_demoapp2\_public\_ip) | Linux Demostration application 2 public IP address |
<!-- END_TF_DOCS -->