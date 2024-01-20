# Create a random name for naming the Resource Group
resource "random_pet" "pet" {
}

locals {
  pf = random_pet.pet.id
}

# Create a randomly named Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-${pf}"
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
  source              = "./prerequisites"
  pf                = local.pf
  tags                = var.tags
  resource_group_name = var.resource_group_name
}

module "deployments" {
  source                        = "./deployments"
  name                          = local.name
  tags                          = var.tags
  sku                           = var.sku
  managed_identity_id           = module.prerequisites.managed_identity_id
  managed_identity_principal_id = module.prerequisites.managed_identity_principal_id
  public_ip_address_id          = module.prerequisites.public_ip_address_id
  subnet_id                     = module.prerequisites.subnet_id
  location                      = module.prerequisites.location
  resource_group_name           = var.resource_group_name
}

module "configurations" {
  source        = "./configurations"
  deployment_id = module.deployments.deployment_id
  configure     = var.configure
  config_files = {
    base = {
      virtual_path = "/etc/nginx/nginx.conf"
      content      = filebase64("${path.module}/files/https/nginx.conf")
    }
    api = {
      virtual_path = "/etc/nginx/site/api.conf"
      content      = filebase64("${path.module}/files/https/api.conf")
    }
  }
  depends_on = [module.certificates]
}