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
| [azurerm_container_group.container1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_group) | resource |
| [azurerm_container_group.container2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_container_subnet_id"></a> [az\_container\_subnet\_id](#input\_az\_container\_subnet\_id) | Subnet assigned for Containers | `string` | `"containersubnet"` | no |
| <a name="input_cpu_cores"></a> [cpu\_cores](#input\_cpu\_cores) | The number of CPU cores to allocate to the container. | `number` | `1` | no |
| <a name="input_image"></a> [image](#input\_image) | Container image to deploy. Should be of the form repoName/imagename:tag for images stored in public Docker Hub, or a fully qualified URI for other registries. Images from private registries require additional registry credentials. | `string` | `"registry.hub.docker.com/ealen/echo-server:latest"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure Region objects are deployed into | `string` | `"eastus"` | no |
| <a name="input_memory_in_gb"></a> [memory\_in\_gb](#input\_memory\_in\_gb) | The amount of memory to allocate to the container in gigabytes. | `number` | `2` | no |
| <a name="input_mypet"></a> [mypet](#input\_mypet) | A unique string appended to ojbect names | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | Port to open on the container and the public IP address. | `number` | `80` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group Name | `string` | `"somerandomstring"` | no |
| <a name="input_restart_policy"></a> [restart\_policy](#input\_restart\_policy) | The behavior of Azure runtime if container has stopped. | `string` | `"Always"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags used on objects created | `map(any)` | <pre>{<br>  "Owner": "addr@example.com",<br>  "env": "Development"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container1_ip"></a> [container1\_ip](#output\_container1\_ip) | The private IP for container 1 |
| <a name="output_container2_ip"></a> [container2\_ip](#output\_container2\_ip) | The private IP for container 2 |
<!-- END_TF_DOCS -->