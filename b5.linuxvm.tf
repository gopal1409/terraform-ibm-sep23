resource "azurerm_linux_virtual_machine" "web_inuxvm" {
  for_each = var.web_linuxvm_instance_count
  name                = "${var.business_unit}-${var.environment}-${var.resource_group_name}-${each.key}"
  ##3once it create the vnet it need to attached inside my rg
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  size                = "Standard_F2"
  admin_username      = "azureuser"
  ##here we need to ensure that when the vm is geeting created it should attach nic card one by one
  network_interface_ids = [
    azurerm_network_interface.web_linux_nic[each.key].id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-key/terraformazure.pem.pub")
    ###path.module means the project folder root directory
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app-script/app.sh")
}