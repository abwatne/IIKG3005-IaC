variable "rg_name" {
  type        = string
  description = "Name of rg"
}

variable "location" {
  type        = string
  description = "Name of location"
}

variable "sa_name" {
  type        = string
  description = "Name of SA"
}

variable "index_document" {
  type        = string
  description = "Name of index doc"
}

variable "source_content" {
  type        = string
  description = "Source for content for index/html side"
  default = "index.html"
}