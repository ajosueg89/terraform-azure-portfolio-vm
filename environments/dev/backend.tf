terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstateigau8u"
    container_name       = "tfstate"
    key                  = "env-dev.tfstate"
  }
}
