### create references to existing resources ###
data "azurerm_resource_group" "rg_dev" {
    name = "rg-microservices-dev-we"
    # name = var.rg_dev
}

data "azurerm_resource_group" "rg_shd" {
    name = "rg-microservices-shd-we"
    # name = var.rg_shd
}

data "azurerm_service_plan" "sp" {
    name = "plan-microservices-dev-we"
    resource_group_name = data.azurerm_resource_group.rg_dev.name
}

data "azurerm_container_registry" "acr" {
  name                = "crmicroservicesshdwe"
  resource_group_name = data.azurerm_resource_group.rg_shd.name
}

### Exircise: creating an App using terraform.workspace ###

# resource "azurerm_linux_web_app" "app" {
#   name                = "app-tokenservice-${terraform.workspace}-we" # Use the terraform.workspace variable for uniqueness
#   location            = "westeurope"
#   resource_group_name = data.azurerm_resource_group.rg_dev.name
#   service_plan_id     = data.azurerm_service_plan.sp.id
#   site_config {
#     application_stack {
#       docker_image_name        = "token_service:dev" # Choose desired image
#       docker_registry_url      = "https://${data.azurerm_container_registry.acr.login_server}"
#       docker_registry_password = data.azurerm_container_registry.acr.admin_password
#       docker_registry_username = data.azurerm_container_registry.acr.admin_username
#     }
#   }
#   identity {
#     type = "SystemAssigned"
#   }
#   tags = {
#     env = var.env
#     tf  = terraform.workspace
#   }
# }
