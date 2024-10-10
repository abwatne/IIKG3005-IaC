variable "rg_name" {
  type        = string
  description = "Name of rg"
  default = "abswtest"
}

variable "location" {
  type        = string
  description = "Name of location"
  default = "abswtest"
}

variable "sa_name" {
  type        = string
  description = "Name of SA"
  default = "abswtest"
}

variable "index_document" {
  type        = string
  description = "Name of index doc"
  default = "abswtest"
}

variable "source_content" {
  type        = string
  description = "Source for content for index/html side"
  default     = "index.html"
}