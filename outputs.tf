# output "my_group_id" {
#     value = data.akamai_group.my_group_id.id
# }

# output "my_configuration" {
#   value = data.akamai_appsec_configuration.my_configuration.id
# }

# output "my_property" {
#   value = data.akamai_property.my_property.id
# }

output "conditional_test" {
  value = var.ab_test == "A" ? "It is A" : "It is B"
}

# output "var1" {
#   value = local.var1
# }

# output "var2" {
#   value = local.var2
# }

# output "var3" {
#   value = local.var3
# }

output "hostname" {
  value = local.hostnames
}