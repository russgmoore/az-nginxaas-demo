/*
output "container1_ipv4_address" {
  value = azurerm_container_group.container1.ip_address
}
output "container2_ipv4_address" {
  value = azurerm_container_group.container2.ip_address
}
*/
output "demo_app_1_private_ip" {
  description = "The Private IP address for Linux VM demonstration application 1"
  value = module.linux_vm_apps.linux_demoapp1_private_ip
}

output "demo_app_1_public_ip" {
  description = "The Public IP address for Linux VM demonstration application 1"
  value = module.prerequisites.linux_demoapp1_public_ip
}

output "demo_app_2_private_ip" {
  description = "The Private IP address for Linux VM demonstration application 2"
  value = module.linux_vm_apps.linux_demoapp2_private_ip
}

output "demo_app_2_public_ip" {
  description = "The Public IP address for Linux VM demonstration application 2"
  value = module.prerequisites.linux_demoapp2_public_ip
}

output "my_public_ip" {
  description = "The public IP of the system running terraform"
  value = data.external.myipaddr.result.ip
}

output "NGINX-ip_address" {
  description = "IP address of NGINXaaS deployment."
  value       = module.prerequisites.nginx_frontend_public_ip
}
