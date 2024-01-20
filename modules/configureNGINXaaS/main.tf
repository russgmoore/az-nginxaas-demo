/*
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
*/
# define the certificate in NGINXaaS
