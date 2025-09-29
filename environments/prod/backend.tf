terraform {
  backend "azurerm" {
    resource_group_name  = "<REPLACE_ME_RG>"
    storage_account_name = "<REPLACE_ME_STORAGE>"
    container_name       = "<REPLACE_ME_CONTAINER>"
    key                  = "env-prod.tfstate"
  }
}
