output "my_group_id" {
    value = data.akamai_group.my_group_id.id
}

output "my_configuration" {
  value = data.akamai_appsec_configuration.my_configuration.id
}

output "my_property" {
  value = data.akamai_property.my_property.id
}