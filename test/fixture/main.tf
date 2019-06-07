module "rg" {
  source                   = "../../"
  rgid                     = var.rgid
  environment              = var.environment
  location                 = var.location
  create_date              = var.create_date
  subscription_id          = var.subscription_id
}

