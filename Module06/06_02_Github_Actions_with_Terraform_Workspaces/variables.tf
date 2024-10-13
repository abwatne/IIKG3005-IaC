variable "rg_name" {
  type        = string
  description = "Name of rg"
  default = "rg-absw"
}

variable "location" {
  type        = string
  description = "Name of location"
  default = "westeurope"
}

variable "sa_name" {
  type        = string
  description = "Name of SA"
  default = "saabsw"
}

variable "index_document" {
  type        = string
  description = "Name of index doc"
  default = "index.html"
}

variable "source_content" {
  type        = string
  description = "Source for content for index/html side"
  default     = "<h1>test</h1>"
}