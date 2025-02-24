# cp_code
resource "akamai_cp_code" "knagula_cp_code" {
  name        = "knagula-cp-code"
  contract_id = data.akamai_group.my_group_id.contract_id
  group_id    = data.akamai_group.my_group_id.id
  product_id  = "prd_Site_Accel"
  timeouts {
    update = "1h"
  }
}

# edge hostname
resource "akamai_edge_hostname" "knagula_edge_hostname" {
  product_id    = "prd_Site_Accel"
  contract_id   = data.akamai_group.my_group_id.contract_id
  group_id      = data.akamai_group.my_group_id.id
  edge_hostname = var.ab_test == "A" ? "www.knagula.tf2.edgetest.edgesuite.net" : "www.knagula.tf3.edgetest.edgesuite.net"
  ip_behavior   = "IPV4"
  ttl           = 300
  timeouts {
    default = "1h"
  }
}

# property
resource "akamai_property" "knagula_property" {
    name    	= "knagula-tf-test01"
    product_id  = "prd_Site_Accel"
    contract_id = data.akamai_group.my_group_id.contract_id
    group_id    = data.akamai_group.my_group_id.id
    dynamic "hostnames" {
      for_each = local.hostnames
      content {
          cname_from             = hostnames.value
          cname_to 	             = "www.knagula.tf2.edgetest.edgesuite.net" # akamai_edge_hostname.knagula_edge_hostname.edge_hostname
          cert_provisioning_type = "DEFAULT"
        }
     }
}


# // Your default rule information
# data "akamai_property_rules_builder" "my_default_rule" {
#   rules_v2023_01_05 {
#     name      = "default"
#     is_secure = false
#     comments  = <<-EOT
#       The behaviors in the default rule apply to all requests for the property hostnames unless another rule overrides these settings.
#     EOT
#     behavior {
#       origin {
#         origin_type                   = "CUSTOMER"
#         hostname                      = "httpbin.org"
#         forward_host_header           = "ORIGIN_HOSTNAME"
#         cache_key_hostname            = "REQUEST_HOST_HEADER"
#         compress                      = true
#         enable_true_client_ip         = false
#         http_port                     = 80
#       }
#     }
#     behavior {
#       cp_code {
#         value {
#           id   = 12345
#           name = "main site"
#         }
#       }
#     }
#     children = [
#       data.akamai_property_rules_builder.compress_text_content.json
#     ]
#   }
# }

# // Your child rule information
# data "akamai_property_rules_builder" "compress_text_content" {
#   rules_v2023_01_05 {
#     name = "Compress Text Content"
#     behavior {
#       gzipResponse {
#           behavior = "ALWAYS"
#       }
#     }
#     criterion {
#       contentType {
#         matchOperator      = "IS_ONE_OF"
#         matchWildcard      = true
#         matchCaseSensitive = false
#         values             = ["text/html*", "text/css*", "application/x-javascript*"]
#       }
#     }
#   }
# }

# output "my_default_rule" {
#   value = data.akamai_property_rules_builder.my_default_rule
# } 
