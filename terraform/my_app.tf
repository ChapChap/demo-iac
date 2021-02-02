module "my_app" {
    source   = "./modules/my-app"

    region  = var.region
    project = var.project

    app_version = var.app_version

    function_name        = var.function_name
    function_entry_point = var.function_entry_point
}