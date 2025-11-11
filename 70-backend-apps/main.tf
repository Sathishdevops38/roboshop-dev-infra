module "components" {
    for_each = var.components
    source = "git::https://github.com/Sathishdevops38/terraform-modules.git//70-backend-apps?ref=main"
    component = each.key
    rule_priority = each.value.rule_priority
}