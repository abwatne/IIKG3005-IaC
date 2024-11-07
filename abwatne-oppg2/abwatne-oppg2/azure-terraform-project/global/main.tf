resource "random_string" "random" {
  length = 3
  special = false
  upper = false
  numeric = false
}

output "random" {
  value = random_string.random.result
  description = "Random string result"
}

variable "base_name" {
  type = string
  description = "Base name"
  default = "absw"
}

output "base_name" {
  value = var.base_name
  description = "Base name output"
}

variable "location" {
  type = string
  description = "Resource group location"
  default = "westeurope"
}

output "location" {
  value = var.location
  description = "Location output"
}

variable "rg_name" {
  type = string
  description = "Resource group name"
  default = "rg"
}

output "rg_name" {
  value = var.rg_name
  description = "Resource group name output"
}