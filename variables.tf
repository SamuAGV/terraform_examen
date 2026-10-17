variable "subscription_id" {
  description = "Identificador de la suscripción Azure for Students."
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Región de Azure donde se crearán el grupo de recursos y la red virtual."
  type        = string
  default     = "Chile Central"
}

variable "resource_group_name" {
  type    = string
  default = "rg-utvt-examen-dev-mxc-001"
}

variable "virtual_network_name" {
  type    = string
  default = "vnet-utvt-examen-dev-mxc-001"
}

variable "app_service_plan_name" {
  type    = string
  default = "asp-utvt-examen-dev-mxc-001"
}

variable "web_app_name" {
  description = "Nombre globalmente único de la aplicación web; conserva el prefijo del examen y añade un sufijo personal."
  type        = string
  default     = "app-utvt-examen-web-dev-mxc-001-samu-36b2"
}

variable "app_service_plan_sku" {
  description = "SKU del plan de App Service. F1 corresponde al nivel gratuito para una aplicación web de Windows."
  type        = string
  default     = "F1"
}

variable "vnet_address_space" {
  description = "Rango CIDR de la red virtual; las subredes deben quedar dentro de este rango y no traslaparse."
  type        = string
  default     = "10.0.0.0/16"
}

variable "app_subnet_name" {
  type    = string
  default = "snet-utvt-examen-app-dev-mxc-001"
}

variable "app_subnet_address_prefix" {
  description = "CIDR canónico de la subred de App Service. El 10.0.1.0/18 del examen corresponde al bloque 10.0.0.0/18."
  type        = string
  default     = "10.0.0.0/18"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
    managed_by  = "terraform"
    project     = "utvt-examen"
  }
}
