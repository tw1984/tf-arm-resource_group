data "azurerm_subscription" "primary" {
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = local.name
  location = var.location

  lifecycle {
    ignore_changes = [tags]
  }

  tags = {
    InfrastructureAsCode = "True"
  }
}