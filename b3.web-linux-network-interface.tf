##create nic 
resource "azurerm_network_interface" "web_linux_nic" {
  for_each = var.web_linuxvm_instance_count
  name                = "${var.business_unit}-${var.environment}-${var.resource_group_name}-${each.key}"
  ##3once it create the vnet it need to attached inside my rg
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  #what nic card required
  ##3nic 
  ip_configuration {
    name = "web-linux-ip-1-${each.key}"
    subnet_id = azurerm_subnet.websubnet.id 
    private_ip_address_allocation =   "Dynamic"
    #public_ip_address_id = azurerm_public_ip.web_linux_publicip.id 
  }
}