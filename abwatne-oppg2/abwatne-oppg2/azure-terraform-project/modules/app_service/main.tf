resource "azurerm_service_plan" "service_plan" {
  name                = "${var.base_name}-${var.splan_name}-${local.workspaces_suffix}-${var.random_string}"
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = local.os_type
  sku_name            = local.sku_name
}

resource "azurerm_linux_web_app" "linux_web_app" {
  name                = "${var.base_name}-${var.linux_web_app_name}-${local.workspaces_suffix}-${var.random_string}"
  resource_group_name = var.rg_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.service_plan.id
  virtual_network_subnet_id = var.snet_id

  site_config {
    minimum_tls_version = "1.3"
    load_balancing_mode = "LeastResponseTime"
  }
}