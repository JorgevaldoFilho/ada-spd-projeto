provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-ada-spd-projeto"
  location = "brazilsouth"
}

module "aks" {
  source                      = "Azure/aks/azurerm"
  resource_group_name         = azurerm_resource_group.rg.name
  location                    = azurerm_resource_group.rg.location
  kubernetes_version          = "1.26.3"
  dns_prefix                  = "ada-spd-projeto"
  enable_role_based_access_control = true

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
