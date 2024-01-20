# create container 1 
resource "azurerm_container_group" "container1" {
  name                = "${var.container_group_name_prefix}-${random_string.container_name1.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Private"
  subnet_ids          = [azurerm_subnet.container.id]
  os_type             = "Linux"
  restart_policy      = var.restart_policy
  tags = var.tags

  container {
    name   = "${var.container_name_prefix}-${random_string.container_name1.result}"
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
  name                = "${var.container_group_name_prefix}-${random_string.container_name2.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_address_type     = "Private"
  subnet_ids          = [azurerm_subnet.container.id]
  os_type             = "Linux"
  restart_policy      = var.restart_policy
  tags = var.tags

  container {
    name   = "${var.container_name_prefix}-${random_string.container_name2.result}"
    image  = var.image
    cpu    = var.cpu_cores
    memory = var.memory_in_gb

    ports {
      port     = var.port
      protocol = "TCP"
    }
  }
}