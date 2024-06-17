resource "azurerm_storage_account" "pr-storageaccount" {
  name                     = "prstorageaccount7053"
  resource_group_name      = azurerm_resource_group.pr-resource-grp.name
  location                 = azurerm_resource_group.pr-resource-grp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  tags = {
    environment = "production"
  }

  static_website {
    index_document = "index.html"
  }
  depends_on = [azurerm_resource_group.pr-resource-grp]
}

resource "azurerm_storage_container" "storage-container" {
  name                  = "storage-container"
  storage_account_name  = azurerm_storage_account.pr-storageaccount.name
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.pr-storageaccount]
}

resource "azurerm_storage_blob" "storage-blob-staticwebsite" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.pr-storageaccount.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = var.source_content
  depends_on             = [azurerm_storage_container.storage-container]
}