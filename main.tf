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
}

module "deployNGINXaaS" {
  source                        = "./modules/deployNGINXaaS"
  sku                           = var.sku
  resource_group_name           = local.resource_group_name 
  pf                            = local.pf
  tags                          = var.tags
  location                      = module.prerequisites.location
  nginx_user_id                 = module.prerequisites.nginxaas_user_id
  nginxaas_principal_id         = module.prerequisites.nginxaas_principal_id
  nginx_frontend_public_ip_id   = module.prerequisites.nginx_frontend_public_ip_id
  nginx_subnet_id               = module.prerequisites.nginx_subnet_id
}
