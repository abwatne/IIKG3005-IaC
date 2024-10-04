variable "rg_backend_name" {
    type = string
    description = "The name for the Backend Resource Group"
    default = "rg-absw-be"
}

variable "location" {
    type = string
    description = "Region where resource group will exist"
    default = "westeurope"
}

variable "sa_backend_name" {
    type = string
    description = "The name for the Backend Storage Account"
    default = "saabswbe"
}

variable "sc_backend_name" {
    type = string
    description = "The name for the Backend Storage Container"
    default = "tfstate"
}

variable "kv_backend_name" {
    type = string
    description = "The name of the Backend Key Vault"
    default = "kv-absw-be"
}

variable "sa_backend_accesskey_name" {
    type = string
    description = "The name for the Bakcend Storage Account Access Key"
    default = "sa-absw-accesskey-be"
}