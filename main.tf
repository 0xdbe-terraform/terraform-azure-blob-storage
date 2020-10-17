# Azure Storage account
resource azurerm_storage_account main {
  name                      = "st${var.storage_account_name}"
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.storage_account_tier
  account_kind              = "BlobStorage"
  account_replication_type  = var.storage_account_replication_type
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
}

# Azure storage container
resource azurerm_storage_container main {
  for_each              = var.storage_container_name
  name                  = each.key
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}