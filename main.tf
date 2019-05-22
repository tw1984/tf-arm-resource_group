resource "azurerm_resource_group" "rg" {
  name     = "${local.name}"
  location = "${var.location}"

  lifecycle {
    ignore_changes = [
      "tags",
    ]
  }

  tags {
    InfrastructureAsCode = "True"
  }
}

resource "azuread_group" "reader" {
  name = "g${local.default_rgid}${local.env_id}${local.rg_type}_AZ_Reader"
}

resource "azurerm_role_assignment" "reader" {
  scope                = "/subscriptions/${var.subscription_id}/resourceGroups/${local.name}"
  role_definition_name = "Reader"
  principal_id         = "${azuread_group.reader.id}"
}
