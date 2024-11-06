/*
resource "azurerm_app_service_environment_v3" "ase_env" {
  name                = "abswasev32342343"
  resource_group_name = var.rg_name
  subnet_id           = var.snet_ase_id
}
*/
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
/*
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.public_ip_name}${local.workspaces_suffix}"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = local.allocation_method
}

resource "azurerm_lb" "lb" {
  name                = "${var.lb_name}${local.workspaces_suffix}"
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "${var.fe_ip_name}${local.workspaces_suffix}"
    #private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip.id
    #subnet_id = var.snet_id
  }
}


resource "azurerm_lb_backend_address_pool" "be_lb_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "BackendPool"
  virtual_network_id = var.vnet_id
}


resource "azurerm_lb_backend_address_pool_address" "be_lb_pool_adr" {
  name                    = "TESTETSTEST"
  backend_address_pool_id = azurerm_lb_backend_address_pool.be_lb_pool.id
  virtual_network_id      = var.vnet_id
  ip_address              = azurerm_linux_web_app.linux_web_app.default_hostname
}
*/
/*
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ipconf_name
    subnet_id                     = var.snet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_backend_address_pool_association" "lb_association" {
  network_interface_id    = azurerm_network_interface.nic.id
  backend_address_pool_id = azurerm_lb_backend_address_pool.be_lb_pool.id
  ip_configuration_name = var.ipconf_name
}
*/
/*
resource "azurerm_static_web_app" "s_web_app" {
  name                = "${var.static_name}${local.workspaces_suffix}"
  resource_group_name = var.rg_name
  location            = var.location
}
*/