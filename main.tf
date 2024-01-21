# Create a random name for naming the Resource Group
resource "random_pet" "pet" {
}

locals {
  pf = random_pet.pet.id
  resource_group_name = "rg-${local.pf}"
}

# Create a randomly named Resource Group
resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location
  tags = var.tags
}


# Create a random string for container1 naming
resource "random_string" "container_name1" {
  length  = 25
  lower   = true
  upper   = false
  special = false
}

# Create a random string for container2 naming
resource "random_string" "container_name2" {
  length  = 25
  lower   = true
  upper   = false
  special = false
}

module "prerequisites" {
  source              = "./modules/prerequisites"
  pf                  = local.pf
  tags                = var.tags
  location            = var.location
  resource_group_name = local.resource_group_name 
  my_ip_address       = data.external.myipaddr.result.ip

  depends_on = [ azurerm_resource_group.rg ]
}

module "linux_vm_apps" {
  source               = "./modules/linuxvm"
  ssh_key_file         = var.ssh_key_file
  pf                   = local.pf
  tags                 = var.tags
  location             = var.location
  resource_group_name  = local.resource_group_name
  linux_demoapp1_interface_id = module.prerequisites.linux_demoapp1_interface_id
  linux_demoapp2_interface_id = module.prerequisites.linux_demoapp2_interface_id
  
  depends_on = [ module.prerequisites ]
}

module "containers" {
  source               = "./modules/containers"
  pf                   = local.pf
  tags                 = var.tags
  location             = var.location
  resource_group_name  = local.resource_group_name
  az_container_subnet_id = module.prerequisites.container_subnet_id
  
  depends_on = [ module.prerequisites ]
}

module "deployNGINXaaS" {
  source                        = "./modules/deployNGINXaaS"
  sku                           = var.sku
  resource_group_name           = local.resource_group_name 
  pf                            = local.pf
  tags                          = var.tags
  location                      = var.location
  nginx_user_id                 = module.prerequisites.nginxaas_user_id
  nginxaas_principal_id         = module.prerequisites.nginxaas_principal_id
  nginx_frontend_public_ip_id   = module.prerequisites.nginx_frontend_public_ip_id
  nginx_subnet_id               = module.prerequisites.nginx_subnet_id

  depends_on = [ module.prerequisites ]
}

module "keyvault" {
  source                        = "./modules/keyvault"
  resource_group_name           = local.resource_group_name 
  pf                            = local.pf
  tags                          = var.tags
  location                      = var.location
  nginxaas_principal_id         = module.prerequisites.nginxaas_principal_id

  depends_on = [ module.prerequisites ]
}

module "nginxcertificate" {
  source                       = "./modules/nginxcertificate"
  nginxaas_deployment_id       = module.deployNGINXaaS.nginxaas_deployment_id
  kv_secret_id                 = module.keyvault.kv_secret_id_example

  depends_on = [ module.deployNGINXaaS, module.keyvault ]
}

module "configureNGINXaaS" {
  source                   = "./modules/configureNGINXaaS"
  nginxaas_deployment_id       = module.deployNGINXaaS.nginxaas_deployment_id
  configure     = var.configure
  config_files = {
    base = {
      virtual_path = "/etc/nginx/nginx.conf"
      content      = filebase64("${path.module}/files/nginx.conf")
    }
    api = {
      virtual_path = "/etc/nginx/site/api.conf"
      content      = filebase64("${path.module}/files/api.conf")
    }
  }
  depends_on = [module.nginxcertificate]
}
  