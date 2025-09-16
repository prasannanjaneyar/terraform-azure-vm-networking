resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

module "vms" {
  source              = "./modules/vm"
  count               = var.vm_count
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  subnet_id           = module.network.subnet_ids[0]
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  vm_name             = "vm-${count.index + 1}"
}
