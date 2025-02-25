// Terraform Documentation: https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/service_principal

resource "databricks_mws_permission_assignment" "workspace_access" {
  workspace_id = var.created_workspace_id
  principal_id = var.user_id
  permissions  = ["ADMIN"]
}