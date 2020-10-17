variable "resource_group_name" {
  type        = string
  default     = "eastus"
  description = "Resource location in Azure (default: 'eastus', less expensive location)"
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "Resource location in Azure (default: 'eastus', less expensive location)"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Storage Account"

  validation {
    condition     = can(regex("[a-z0-9]{3,24}", var.storage_account_name))
    error_message = "Storage account name can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long."
  }
}

variable "storage_account_tier" {
  type        = string
  description = "Princing tier of the storage account"
  default     = "Standard"

  validation {
    condition     = contains(["Standard","Premium"],var.storage_account_tier)
    error_message = "Valid options for account tier are Standard or Premium."
  }
}

variable "storage_account_replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account."
  default     = "LRS"

  validation {
    condition     = contains(["LRS","GRS","RAGRS","ZRS","GZRS","RAGZRS"],var.storage_account_replication_type)
    error_message = "Valid replication options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
  }
}

variable "storage_container_name" {
  type        = set(string)
  description = "Name list of the Storage container"
  default     = []
}