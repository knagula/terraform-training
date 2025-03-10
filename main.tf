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

locals {
    notes = "TF-3001/${data.akamai_group.my_group_id.id}"
}

locals {
    var1 = ceil(12.33)
}

locals {
    var2 = replace("knagula_property_name", "_", " ")
}

locals {
    var3 = length(["apple", "ball", "cat"]) + local.var1
}

locals {
  hostnames = [for item in var.apps : "${item}.example.com"]
}