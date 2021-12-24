variable "resource_group_location" {
  type        = string
  default     = "westeurope"
  description = "Pick your location using ```az account list-locations -o table``` command (example: westeurope)"
}

variable "resource_group_name" {
  type        = string
  default     = "tf-default"
  description = "Pick your name of the resource group"
}