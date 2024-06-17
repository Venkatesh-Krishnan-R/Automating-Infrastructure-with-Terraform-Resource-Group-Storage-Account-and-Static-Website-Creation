resource "azurerm_storage_blob" "maintf" {
  name                   = "main.tf"
  storage_account_name   = azurerm_storage_account.pr-storageaccount.name
  storage_container_name = azurerm_storage_container.storage-container.name
  type                   = "Block"
  source                 = "main.tfplan"
  depends_on = [
    azurerm_storage_container.storage-container
  ]
}