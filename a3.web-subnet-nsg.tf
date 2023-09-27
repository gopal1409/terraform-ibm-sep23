###this way we have create the subnet inside my vnet
resource "azurerm_subnet" "websubnet" {
  name                = "${var.business_unit}-${var.environment}-${var.resource_group_name}-websubnet"
  ##3once it create the vnet it need to attached inside my rg
  #location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  #when we create a subnet this subnet need to be mapped with vnet
  virtual_network_name = azurerm_virtual_network.vnet.name 
  address_prefixes = var.web_subnet_address
}

#create an nsg
resource "azurerm_network_security_group" "web_subnet_nsg" {
  name                = "${var.business_unit}-${var.environment}-${var.resource_group_name}-nsg"
  ##3once it create the vnet it need to attached inside my rg
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
}