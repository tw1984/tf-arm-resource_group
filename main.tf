resource "azurerm_resource_group" "rg" {
  name = "${local.name}"
  location = "${var.location}"
  lifecycle {
    ignore_changes = [
      "tags"
    ]
  }
}