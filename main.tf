# akamai_group
data "akamai_group" "my_group_id" {
    group_name  = "My group name"
    contract_id = "ctr_C-0N7RAC7"
}

# akamai_appsec_configuration
data "akamai_appsec_configuration" "my_configuration" {
    name = "my appsec config"
}

# akamai_property
data "akamai_property" "my_property" {
    name = "my-property-1"
    version = "1"
}

output "my_group_id" {
    value = data.akamai_group.my_group_id.group_name
}

output "my_configuration" {
  value = data.akamai_appsec_configuration.my_configuration.host_names
}

output "my_property" {
  value = data.akamai_property.my_property.name
}