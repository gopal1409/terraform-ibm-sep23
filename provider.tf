terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      #version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "azurerm" {
  features {
    #delete_os_disk_on_deletion = false
    #if you delet ethe vm the os disk will not be deleted. the default behaviour in azure is that you 
    ###delete the vm os disk get deleted automatically. 
  }
}