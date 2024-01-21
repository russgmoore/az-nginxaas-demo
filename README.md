# NGINXaaS deployed via Terraform onto Azure

This repo and contained Terraform was built to created to build a new unique resource group,
define and deploy resources such as VMs and containers and finally deploy NGINXaaS. 

This can be used for demonstration purposes or for building a test platform to test rules and configuration items.

## Terraform settings
Configure your terraform environment so that you can access your Azure tenant per your own taste.

Refer to the F5 NGINXaaS Terraform site for more details on configuring your Terraform environment and 
details on code snippets you may find included in this repo.

https://docs.nginx.com/nginxaas/azure/client-tools/terraform/

You'll need to run "terraform init" and I'd suggest a "terraform plan" to test before applying.
You will need access to an Azure instance and have configured that access from your system for this
demonstration code to run.

https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure


### Terraform

```bash
terraform init
terraform plan
terraform apply --var="configure=false" --auto-approve
./importconfig.sh
terraform apply --auto-approve
```

Configure the **settings.tfvars** file to customize the deployment. For F5'ers you must define your mail address 
for the Owner tag or your resources may be deleted without notice.

The code generates unique object names to avoid conflicts with others.
The code also attempts to determine your public IP and inserts that into the Security Group for access control.  
If you experience access problems to the deployment this may be a part of the problem.

## Two Demo APP VMs in module linuxvm
Two ngninx OSS web servers are deployed. 
These demo app servers are defined in the terraform files:

These can be used for demonstrations and tests of failover, traffic rules, and header injection/manipulation.
These systems are what respond when you open a browser to the "NGINXaaS Public IP" root URI.

The Linux VMs are deployed and configured as Demo App servers as defined in:
https://docs.nginx.com/nginx/deployment-guides/setting-up-nginx-demo-environment/

The **userdata.tftpl** file defines the configurations for these two servers.
This is shell script that runs through the clout-init process.

These two demo servers are statically assigned 10.0.1.10 and 10.0.1.11 and both listen on port 80
Each demo app server will be assigned a public IP, an NSG assigned to allown only your public IP to ssh
to it and the public key configured outside of this repo to login.

## Two echo containers are deployed via module containers

These two echo server instances are deployed and configured in the nginx.conf file to respond when you issue
requests to the "NGINXaaS Public IP" and the /container URI.

Echo servers are great to immmediately see all of the related headers and so on that the web servers see when
you make a request reflected back to you in the page render.

The two containers are configured so they will always deploy with the same IPs, 10.0.2.4 and 10.0.2.5.

## NGINXaaS deployment
The NGINXaaS deployment is configured and set with a public IP and is ready to configure.
NGINXaaS when provisioned will have a default configuration applied. 

You are now ready to go into the Azure Portal and setup the NGINXaaS configuration and so on.

### Importing the Default

You can deploy new configurations to NGINXaaS but if you attempt to do this during the initial deployment, you will get an error as the default configuration is already deployed.
Terraform doesn't know about this default so it will throw and error.

*See issue ID:* **ID-891**
https://docs.nginx.com/nginxaas/azure/known-issues/

If you wish to deploy a configuration with this repo's code. You will need to import the default configuration and do another apply to place your configuration on the system. 

Run the "importconfig.sh" script after your first apply and the object should be under management of Terraform at that point.
Make sure you set the "configure" variable to "true" if you wish to have the next run on Terraform apply to install the configurations as defined in "files".

The error you may see for this existing configuration will appear similar to the following:

```
│ Error: A resource with the ID "/subscriptions/<SUBSCRIPTION>/resourceGroups/<RESOURCEGROUPNAME>/providers/Nginx.NginxPlus/nginxDeployments/nginxaas-demo/configurations/default" already exists - to be managed via Terraform this resource needs to be imported into the State. Please see the resource documentation for "azurerm_nginx_configuration" for more information.
│ 
│   with azurerm_nginx_configuration.nginxaas-config,
│   on nginxaas-deployment.tf line 24, in resource "azurerm_nginx_configuration" "nginxaas-config":
│   24: resource "azurerm_nginx_configuration" "nginxaas-config" {
│ 
│ A resource with the ID "/subscriptions/<SUBSCRIPTION>/resourceGroups/<RESOURCEGROUPNAME>/providers/Nginx.NginxPlus/nginxDeployments/nginxaas-demo/configurations/default" already exists - to be managed
│ via Terraform this resource needs to be imported into the State. Please see the resource documentation for "azurerm_nginx_configuration" for more information.
╵
```

**NOTE:** Replace the "SUBSCRIPTIONID" and "RESOURCEGROUPNAME" with the proper data from your subscription and resource group name

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.57 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~>4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.88.0 |
| <a name="provider_external"></a> [external](#provider\_external) | 2.3.2 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_configureNGINXaaS"></a> [configureNGINXaaS](#module\_configureNGINXaaS) | ./modules/configureNGINXaaS | n/a |
| <a name="module_containers"></a> [containers](#module\_containers) | ./modules/containers | n/a |
| <a name="module_deployNGINXaaS"></a> [deployNGINXaaS](#module\_deployNGINXaaS) | ./modules/deployNGINXaaS | n/a |
| <a name="module_keyvault"></a> [keyvault](#module\_keyvault) | ./modules/keyvault | n/a |
| <a name="module_linux_vm_apps"></a> [linux\_vm\_apps](#module\_linux\_vm\_apps) | ./modules/linuxvm | n/a |
| <a name="module_nginxcertificate"></a> [nginxcertificate](#module\_nginxcertificate) | ./modules/nginxcertificate | n/a |
| <a name="module_prerequisites"></a> [prerequisites](#module\_prerequisites) | ./modules/prerequisites | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_pet.pet](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [external_external.myipaddr](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_configure"></a> [configure](#input\_configure) | Workaround for Bug ID-891. Set false to skip configuration. | `bool` | `true` | no |
| <a name="input_cpu_cores"></a> [cpu\_cores](#input\_cpu\_cores) | The number of CPU cores to allocate to each container. | `number` | `1` | no |
| <a name="input_image"></a> [image](#input\_image) | Container image to deploy. Should be of the form repoName/imagename:tag for images stored in public Docker Hub, or a fully qualified URI for other registries. Images from private registries require additional registry credentials. | `string` | `"registry.hub.docker.com/ealen/echo-server:latest"` | no |
| <a name="input_instance_size"></a> [instance\_size](#input\_instance\_size) | Azure Linux VM instance size | `string` | `"Standard_B1ls"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure Region objects will be deployed into | `string` | `"eastus"` | no |
| <a name="input_memory_in_gb"></a> [memory\_in\_gb](#input\_memory\_in\_gb) | The amount of memory to allocate to each container in gigabytes. | `number` | `2` | no |
| <a name="input_port"></a> [port](#input\_port) | Port to open on the container and the public IP address. | `number` | `80` | no |
| <a name="input_restart_policy"></a> [restart\_policy](#input\_restart\_policy) | The behavior of Azure runtime if container has stopped. | `string` | `"Always"` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU of NGINXaaS deployment | `string` | `"standard_Monthly"` | no |
| <a name="input_ssh_key_file"></a> [ssh\_key\_file](#input\_ssh\_key\_file) | File where existing SSH key is used for loading on instance | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags used on objects created | `map(any)` | <pre>{<br>  "Owner": "addr@example.com",<br>  "env": "Development"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_NGINX-ip_address"></a> [NGINX-ip\_address](#output\_NGINX-ip\_address) | IP address of NGINXaaS deployment. |
| <a name="output_container1_ipv4_address"></a> [container1\_ipv4\_address](#output\_container1\_ipv4\_address) | Container 1 private IP address |
| <a name="output_container2_ipv4_address"></a> [container2\_ipv4\_address](#output\_container2\_ipv4\_address) | Container 2 private IP address |
| <a name="output_demo_app_1_private_ip"></a> [demo\_app\_1\_private\_ip](#output\_demo\_app\_1\_private\_ip) | The Private IP address for Linux VM demonstration application 1 |
| <a name="output_demo_app_1_public_ip"></a> [demo\_app\_1\_public\_ip](#output\_demo\_app\_1\_public\_ip) | The Public IP address for Linux VM demonstration application 1 |
| <a name="output_demo_app_2_private_ip"></a> [demo\_app\_2\_private\_ip](#output\_demo\_app\_2\_private\_ip) | The Private IP address for Linux VM demonstration application 2 |
| <a name="output_demo_app_2_public_ip"></a> [demo\_app\_2\_public\_ip](#output\_demo\_app\_2\_public\_ip) | The Public IP address for Linux VM demonstration application 2 |
| <a name="output_my_public_ip"></a> [my\_public\_ip](#output\_my\_public\_ip) | The public IP of the system running Terraform used in Security Group for access control |
| <a name="output_nginx_default_config_id"></a> [nginx\_default\_config\_id](#output\_nginx\_default\_config\_id) | NGINXaaS deployment default configuration ID |
<!-- END_TF_DOCS -->