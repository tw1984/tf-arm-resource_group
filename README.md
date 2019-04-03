# cr-azurerm_resource_group

Creates an resource group.

# IMPORTANT - Inter-module dependencies

The resource group is a dependency for all things that are created inside it, so it must already be fully provisioned before using any of the other CR Terraform modules.  The `depends_on` Terraform keyword is not supported for module dependencies in 0.11, but there is some work that should make it into v0.12, not yet released.

To use this as a Terraform module, you have to create some kind of depdency that forces it to be created first. We do this by creating a module input for each child (ie: an azurerm_app_service module block) that is depdendent on an output from the parent (ie: this resource group module).  For this to work, the input thing must be utilized by the provisioner in the child.

**Be careful with this** - until this feature is supported natively, there's no protection against race conditions.  You could create a two-way input/output dependency between blocks.

For more info about this idea, see:

* https://github.com/hashicorp/terraform/issues/18239#issuecomment-401187835
* https://github.com/hashicorp/terraform/issues/17101

# Required Input Variables

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
  create_date = "${var.create_date}"
  rgid = "${var.rgid}"
}
```
