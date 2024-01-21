# create container 1 
resource "azurerm_container_group" "container1" {
  name                = "container1-${var.mypet}"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Private"
  subnet_ids          = [var.az_container_subnet_id]
  os_type             = "Linux"
  restart_policy      = var.restart_policy
  tags = var.tags

  container {
    name   = "container1-${var.mypet}"
    image  = var.image
    cpu    = var.cpu_cores
    memory = var.memory_in_gb

    ports {
      port     = var.port
      protocol = "TCP"
    }
  }
}

# create container 2
resource "azurerm_container_group" "container2" {
  name                = "container2-${var.mypet}"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "Private"
  subnet_ids          = [var.az_container_subnet_id]
  os_type             = "Linux"
  restart_policy      = var.restart_policy
  tags = var.tags

  container {
    name   = "container2-${var.mypet}"
    image  = var.image
    cpu    = var.cpu_cores
    memory = var.memory_in_gb

    ports {
      port     = var.port
      protocol = "TCP"
    }
  }
}