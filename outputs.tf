output "resource_group_name" {
  value = azurerm_resource_group.this.name
}

output "virtual_network_id" {
  value = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  value = azurerm_subnet.app.id
}

output "subnet_address_prefixes" {
  value = azurerm_subnet.app.address_prefixes
}

output "app_service_plan_id" {
  value = azurerm_service_plan.this.id
}

output "web_app_url" {
  value = "https://${azurerm_windows_web_app.this.default_hostname}"
}
