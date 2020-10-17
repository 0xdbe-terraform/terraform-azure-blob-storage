# Terraform Azure Blob Storage

Terraform module to create Azure Storage Account and Container for blob storage.

## Usage

```hcl
locals {
  application_name = "HelloWorld"
  location         = "eastus"
}

module "azure_ressource_group" {
  source       = "git::https://github.com/0xdbe-terraform/terraform-azure-resource-group.git?ref=v1.0.1"
  name         = local.application_name
  location     = local.location
}

module "azure_blob_storage" {
  source                 = "git::https://github.com/0xdbe-terraform/terraform-azure-blob-storage.git?ref=v1.0.0"
  resource_group_name    = module.azure_ressource_group.name
  location               = local.location
  storage_account_name   = lower(local.application_name)
  storage_container_name = ["images","files"]
}
```

## To Do

What still needs to be done:

- [ ] Add public storage container
- [ ] Manage access control on blob storage