terraform {
  backend "azurerm" {
    resource_group_name   = "demo-resources"
    storage_account_name  = "networkingautomation"
    container_name        = "terraformstate"
    key                   = "terraform.tfstate"
  }
}
