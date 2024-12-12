# akamai_group
data "akamai_group" "my_group_id" {
    group_name  = "Akamai Technologies - Assets-1-3CV382"
    contract_id = "1-3CV382"
}

# akamai_appsec_configuration
data "akamai_appsec_configuration" "my_configuration" {
    name = "AHSecTest"
}

# akamai_property
data "akamai_property" "my_property" {
    name = "knagula-tf-test"
    version = "1"
}