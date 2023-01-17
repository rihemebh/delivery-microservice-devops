resource "azurerm_resource_group" "rg" {
  name     = "devops-project-1"
  location = "North Europe"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "koultime-aks1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "koultimeaks1"
 #sku_tier = "Free"
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

