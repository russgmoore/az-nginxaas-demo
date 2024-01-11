# NGINXaaS deployed via Terraform onto Azure

## Terraform settings
Configure your terraform environment so that you can access your Azure tenant per your own taste.

Configure the **settings.tfvars** file to customize the deployment. For F5'ers you must define your mail address 
for the Owner tag or your resources may be deleted without notice.

You should change the azure-rgi-1 variable to something unique as others may be using this template.

## Two Demo APP VMs
Two ngninx OSS web servers are deployed. 
These demo app servers are defined in the terraform files:

**nginxoss-vm-demo-app-1.tf** 

**nginxoss-vm-demo-app-2.tf** 

The Linux VMs are deployed and configured as Demo App servers as defined in:
https://docs.nginx.com/nginx/deployment-guides/setting-up-nginx-demo-environment/

The **userdata.tftpl** file defines the configurations for these two servers.
This is shell script that runs through the clout-init process.

These two demo servers are statically assigned 10.0.1.10 and 10.0.1.11 and both listen on port 80
Each demo app server will be assigned a public IP, an NSG assigned to allown only your public IP to ssh
to it and the public key configured outside of this repo to login.

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

Edit the "nginxaas-deployment.tf" and uncomment the area as described in the below section.
### Deploy a configuration with Terraform
Due the pre-existing NGINXaaS configuration, this repo has the following section commented out in **nginxaas-deployment.tf** to avoid this issue.

```
/* <- this starts a comment block. Remove this and the trailing to enable.
resource "azurerm_nginx_configuration" "nginxaas-config" {
  nginx_deployment_id = azurerm_nginx_deployment.nginxaas-demo.id
  root_file           = "/etc/nginx/nginx.conf"

  config_file {
    content      = filebase64("${path.module}/nginx.conf")
    virtual_path = "/etc/nginx/nginx.conf"
  }

  config_file {
    content      = filebase64("${path.module}/api.conf")
    virtual_path = "/etc/nginx/site/api.conf"
  }
}
*/ <- This ends the comment block. Remove to enable deploying the defined configuration.
```

After you uncomment this section you can run your Terraform again. This time it will give you and error with the Object ID of the existing config.

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

To import the existing configuration you can run the following command ( *the below is all one line* ):

`terraform import nginxaas-config /subscriptions/SUBSCRIPTIONID/resourceGroups/RESOURCEGROUPNAME/providers/Nginx.NginxPlus/nginxDeployments/nginxaas-demo/configurations/default`

**NOTE:** Replace the "SUBSCRIPTIONID" and "RESOURCEGROUPNAME" with the proper data from your subscription and resource group name

After importing the default configuration, you can use Terraform to apply your plan and your nginx.conf file will be installed if there are no issues with it.
