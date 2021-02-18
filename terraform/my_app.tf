module "my_app" {
    source = "./modules/my-app"

    region  = var.region
    project = var.project

    function_name        = var.function_name
    function_entry_point = var.function_entry_point
}