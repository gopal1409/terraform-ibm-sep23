###this way we have create the subnet inside my vnet
resource "azurerm_subnet" "websubnet" {
    depends_on = [ azurerm_resource_group.myrg ]
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
  #depends_on = [ azurerm_network_security_rule.web_nsg_rule ]
  name                = "${var.business_unit}-${var.environment}-${var.resource_group_name}-nsg"
  ##3once it create the vnet it need to attached inside my rg
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
}

locals {
  web_inbound_ports_map = {
    "100" : "80",
    "110" : "443",
    "120" : "22"
  }
}
###lets create network security rule
###to open multiple ports using nsg 222 443
resource "azurerm_network_security_rule" "web_nsg_rule"{
for_each = local.web_inbound_ports_map
###for each accept argument as each.value and each.key 
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.myrg.name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
}

