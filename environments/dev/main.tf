locals {
  tags = {
    project = "portfolio-terraform-azure"
    env     = var.env
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.env}-portfolio"
  location = var.location
  tags     = local.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.env}"
  address_space       = [var.address_space]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "snet-${var.env}-app"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_prefix]
}

module "nsg" {
  source              = "../../modules/nsg"
  name                = "nsg-${var.env}-app"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.tags
}

resource "azurerm_subnet_network_security_group_association" "link" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = module.nsg.id
}

module "vm" {
  source              = "../../modules/vm"
  name                = "vm-${var.env}-web-01"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet.id
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  ssh_public_key_path = var.ssh_public_key_path
  tags                = local.tags
}
