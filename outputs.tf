output "demo-app-1_private_ip" {
  value = azurerm_linux_virtual_machine.demo-app-1.private_ip_address
}

output "demo-app-1_public_ip" {
  value = azurerm_linux_virtual_machine.demo-app-1.public_ip_address
}

output "demo-app-2_private_ip" {
  value = azurerm_linux_virtual_machine.demo-app-2.private_ip_address
}

output "demo-app-2_public_ip" {
  value = azurerm_linux_virtual_machine.demo-app-2.public_ip_address
}

output "ssh_key" {
  value = "The SSH key for access is the one in ${var.ssh_key_file}"
}

output "my_public_ip" {
  description = "The public IP of the system running terraform"
  value = data.external.myipaddr.result.ip
}

output "ip_address" {
  description = "IP address of NGINXaaS deployment."
  value       = azurerm_nginx_deployment.nginxaas-demo.ip_address
}
