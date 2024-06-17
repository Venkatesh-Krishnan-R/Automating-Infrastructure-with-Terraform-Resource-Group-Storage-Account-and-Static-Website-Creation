terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "4d01b490-7099-4b7a-a2f7-337cee5177c7"
  tenant_id       = "3fce1092-8f1c-40fb-a540-71f39fb36a43"
  client_id       = "3d7a7a3b-d4cd-4285-9105-cb2a978bdc2b"
  client_secret   = "vn_8Q~vS4rw4VoT-QmSshA_5Ai8Yy0MNOSZ7lbCi"
  features {}
}
