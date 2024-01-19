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