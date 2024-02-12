provider "azurerm" {
    features {
      
    }
  
}
resource "azurerm_resource_group" "reg-rg" {
  name     = "registry-resource"
  location = "koreasouth"
}

resource "azurerm_container_registry" "con-reg" {
  name                = "ConDReg"
  resource_group_name = azurerm_resource_group.reg-rg.name
  location            = azurerm_resource_group.reg-rg.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}
