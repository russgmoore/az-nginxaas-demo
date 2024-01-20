output "nginxaas_user_id" {
  description = "Managed user identity for the NGINXaaS deployment"
  value       = azurerm_user_assigned_identity.id_nginxaas.id
}

output "nginxaas_principal_id" {
  description = "Principal ID the NGINXaaS user identity."
  value       = azurerm_user_assigned_identity.id_nginxaas.principal_id
}

output "nginx_frontend_public_ip_id" {
  description = "ID of public IP address."
  value       = azurerm_public_ip.pip_ngxaas.id
}

output "nginx_frontend_public_ip" {
  description = "NGINXaaS public IP address."
  value       = azurerm_public_ip.pip_ngxaas.ip
}

output "nginx_subnet_id" {
  description = "ID of delegated subnet."
  value       = azurerm_subnet.nginx_subnet.id
}

output "linux_demoapp1_interface_id" {
  description = "Linux Demostration application 1 Interface ID"
  value       = azurerm_network_interface.int_demo_app_1.id
}

output "linux_demoapp2_interface_id" {
  description = "Linux Demostration application 2 Interface ID"
  value       = azurerm_network_interface.int_demo_app_2.id
}

output "linux_demoapp1_public_ip" {
  description = "Linux Demostration application 1 public IP address"
  value       = azurerm_public_ip.pip_demo_app_1.ip_address
}

output "linux_demoapp2_public_ip" {
  description = "Linux Demostration application 2 public IP address"
  value       = azurerm_public_ip.pip_demo_app_2.ip_address
}

output "container_subnet" {
  description = "Subnet defined for Containers deployment"
  value = azurerm_subnet.container
}
