resource "azurerm_mssql_server" "db_server" {
  name                         = "ada-mydbserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.db_admin
  administrator_login_password = var.db_password
}

resource "azurerm_mssql_database" "db" {
  name                = var.database_name
  resource_group_name = azurerm_resource_group.rg.name
  server_id           = azurerm_mssql_server.db_server.id
  sku_name            = "Basic"
}
