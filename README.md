# az-nginxaas-demo
Terraform deploy 2 ngninx web servers and nginxaas for demonstration purposes

The Linux VMs are deployed and configured as Demo App servers as defined in:
https://docs.nginx.com/nginx/deployment-guides/setting-up-nginx-demo-environment/

Terraform is configured to enumerate the demo app servers so that no editing is required.
These two demo servers are statically assigned 10.0.1.10 and 10.0.1.11 and both listen on port 80

The NGINXaaS deployment is configured and set with a public IP and is ready to configure.
