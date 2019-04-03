# cr-azurerm_resource_group

Creates an resource group.

# Required Input Variable

* `create_date` - In the form YYYYMMDD - used in naming standard
* `rgid` - 5-digit number resource group ID - used in naming standard

# Example

```
variable "create_date" {
  default = "20190401"
}

variable "rgid" {
  default = "99999"
}

module "rg" {
  source = "git::ssh://git@github.com/clearesult/cr-azurerm_resource_group.git"
}
```
