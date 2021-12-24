# ================== azurerm_resource_group ========================
resource "azurerm_resource_group" "arg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}


# resource "azurerm_storage_account" "example" {
#   name                     = "azureteststorage${random_integer.ri.result}"
#   resource_group_name      = azurerm_resource_group.example.name
#   location                 = azurerm_resource_group.example.location
#   account_tier             = "Standard"  # "Standard", "Premium"
#   account_replication_type = "LRS" # LRS, GRS, ZRS, GZRS
# }

# resource "azurerm_storage_share" "example" {
#   name                 = "sharename"
#   storage_account_name = azurerm_storage_account.example.name
#   quota                = 50

#   acl {
#     id = "MTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjM0NTY3ODkwMTI"

#     access_policy {
#       permissions = "rwdl"
#       start       = "2019-07-02T09:38:21.0000000Z"
#       expiry      = "2019-07-02T10:38:21.0000000Z"
#     }
#   }
# }


