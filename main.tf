data "azurerm_subscription" "primary" {}

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

resource "azuread_group" "reader" {
  name = format("g%s%s%s_AZ_Reader", local.default_rgid, local.env_id, local.rg_type)
}

resource "azurerm_role_assignment" "reader" {
  scope                = format("%s/resourceGroups/%s", data.azurerm_subscription.primary.id, azurerm_resource_group.rg.name)
  role_definition_name = "Reader"
  principal_id         = azuread_group.reader.id
}

