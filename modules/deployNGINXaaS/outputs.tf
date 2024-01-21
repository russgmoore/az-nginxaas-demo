output "nginxaas_deployment_id" {
  description = "The ID for our NGINXaaS deployment"
  value = azurerm_nginx_deployment.nginxaas-demo.id
}
