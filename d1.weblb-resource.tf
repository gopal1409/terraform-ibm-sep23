resource "azurerm_public_ip" "web_pbpublicip" {
  name                = "${var.business_unit}-${var.environment}-${var.resource_group_name}-albpublicip"
  ##3once it create the vnet it need to attached inside my rg
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  allocation_method = "Static"
  sku = "Standard"
}

####we will create the lb
resource "azurerm_lb" "web_lb" {
   name                = "${var.business_unit}-${var.environment}-${var.resource_group_name}-alb"
  ##3once it create the vnet it need to attached inside my rg
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  sku = "Standard"
  ###the lb required a public ip
  frontend_ip_configuration {
    name = "weblb-puyblicip"
    public_ip_address_id = azurerm_public_ip.web_pbpublicip.id
  }
}

##we will create the backend addres pool
resource "azurerm_lb_backend_address_pool" "web_lb_backend_address_pool" {
  
  name = "web_backend_pool"
  loadbalancer_id = azurerm_lb.web_lb.id

}

##we will create the probes
resource "azurerm_lb_probe" "web_lb_probe" {
  name="tcp-probe"
  protocol = "Tcp"
  port = 80
    loadbalancer_id = azurerm_lb.web_lb.id
}

#create loadbalancer rule
resource "azurerm_lb_rule" "web_lb_rule_app" {
 loadbalancer_id = azurerm_lb.web_lb.id
  name                           = "web_app_rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id]
}

##we need to assocaite the network interface and standard load balancer
resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_associate" {
    ###behind backend address pool there will multiple instance
  for_each = var.web_linuxvm_instance_count
  network_interface_id = azurerm_network_interface.web_linux_nic[each.key].id 
  ip_configuration_name =  azurerm_network_interface.web_linux_nic[each.key].ip_configuration[0].name  
  backend_address_pool_id = azurerm_lb_backend_address_pool.web_lb_backend_address_pool.id  
}