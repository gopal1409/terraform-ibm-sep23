resource "azurerm_public_ip" "web_linux_publicip" {
  name                = "${var.business_unit}-${var.environment}-${var.resource_group_name}-publicip"
  ##3once it create the vnet it need to attached inside my rg
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  allocation_method = "Static"
  sku = "Standard"
  #what nic card required
}