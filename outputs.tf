output "container1_ipv4_address" {
  description = "Container 1 private IP address"
  value = module.containers.container1_ip
}

output "container2_ipv4_address" {
  description = "Container 2 private IP address"
  value = module.containers.container2_ip
}

output "demo_app_1_private_ip" {
  description = "The Private IP address for Linux VM demonstration application 1"
  value = module.linux_vm_apps.linux_demoapp1_private_ip
}

output "demo_app_1_public_ip" {
  description = "The Public IP address for Linux VM demonstration application 1"
  value = module.linux_vm_apps.linux_demoapp1_public_ip
}

output "demo_app_2_private_ip" {
  description = "The Private IP address for Linux VM demonstration application 2"
  value = module.linux_vm_apps.linux_demoapp2_private_ip
}

output "demo_app_2_public_ip" {
  description = "The Public IP address for Linux VM demonstration application 2"
  value = module.linux_vm_apps.linux_demoapp2_public_ip
}

output "my_public_ip" {
  description = "The public IP of the system running Terraform used in Security Group for access control"
  value = data.external.myipaddr.result.ip
}

output "NGINX-ip_address" {
  description = "IP address of NGINXaaS deployment."
  value       = module.prerequisites.nginx_frontend_public_ip
}

output "nginx_default_config_id" {
  description = "NGINXaaS deployment default configuration ID"
  value       = "${module.deployNGINXaaS.nginxaas_deployment_id}/configurations/default"
}