resource "azurerm_key_vault" "kv" {
  name                        = "ada-spd-keyvault"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = module.aks.kubelet_identity_object_id
    secret_permissions = [
      "get", "list"
    ]
  }
}
