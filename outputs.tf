output "key_vault_uri" {
  value = azurerm_key_vault.kv.vault_uri
}

output "kube_config" {
  value     = module.aks.kube_config_raw
  sensitive = true
}
