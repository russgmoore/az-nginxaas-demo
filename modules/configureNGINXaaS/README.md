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
| [azurerm_nginx_configuration.nginxaas-config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nginx_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_files"></a> [config\_files](#input\_config\_files) | Config files and paths to include in the NGINXaaS configuration | <pre>map(object({<br>    content      = string<br>    virtual_path = string<br>  }))</pre> | n/a | yes |
| <a name="input_configure"></a> [configure](#input\_configure) | Workaround for Bug ID-891. Set false to skip configuration. | `bool` | `true` | no |
| <a name="input_nginxaas_deployment_id"></a> [nginxaas\_deployment\_id](#input\_nginxaas\_deployment\_id) | NGINXaaS deployment ID | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->