###we are going to create the vnet
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.business_unit}-${var.environment}-${var.resource_group_name}-vnet"
  ##3once it create the vnet it need to attached inside my rg
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  address_space       = var.vnet_address_space
  
  tags = {
    environment = "Production"
  }
}