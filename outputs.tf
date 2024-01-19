output "container1_ipv4_address" {
  value = azurerm_container_group.container1.ip_address
}
output "container2_ipv4_address" {
  value = azurerm_container_group.container2.ip_address
}
output "demo_app_1_private_ip" {
  value = azurerm_linux_virtual_machine.demo_app_1.private_ip_address
}

output "demo_app_1_public_ip" {
  value = azurerm_linux_virtual_machine.demo_app_1.public_ip_address
}

output "demo_app_2_private_ip" {
  value = azurerm_linux_virtual_machine.demo_app_2.private_ip_address
}

output "demo_app_2_public_ip" {
  value = azurerm_linux_virtual_machine.demo_app_2.public_ip_address
}

output "my_public_ip" {
  description = "The public IP of the system running terraform"
  value = data.external.myipaddr.result.ip
}

/*
output "NGINX-ip_address" {
  description = "IP address of NGINXaaS deployment."
  value       = azurerm_nginx_deployment.nginxaas-demo.ip_address
}
*/