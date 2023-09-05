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

This will cause Terraform to throw and error during the first apply
You will need to import the default configuration and do another apply to place your configuration on the system. Alternatively you can 
just remove the resource **"azurerm_nginx_configuration" "nginxaas-config"** directives or comment it out. Then apply your configuration throught he Azure Portal.

The syntax to import is as follows:
terraform import "/subscriptions/*<SUBSCRIPTIONID>*/resourceGroups/*<RESOURCEGROUPNAME>*/providers/Nginx.NginxPlus/nginxDeployments/nginxaas-demo/configurations/default"
Then run "terraform apply" again and your configuration will be applied.
