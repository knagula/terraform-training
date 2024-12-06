data "akamai_appsec_configuration" "knagula_appsec_config" {
    name = "My security configuration"
}

output "my_appsec_config" {
  value = data.akamai_appsec_configuration.knagula_appsec_config
}

# appsec config
resource "akamai_appsec_configuration" "knagula-appsec-config" {
 name        = "knagula-TF-test-appsec-config"
 description = "This is my new configuration."
  contract_id   = data.akamai_group.my_group_id.contract_id
  group_id      = 18385
 host_names  = ["001-dn004-testtest.akamaiorigin.net"]
}

# appsec security policy
resource "akamai_appsec_security_policy" "knagula-appsec-secpolicy" {
  config_id              = data.akamai_appsec_configuration.knagula_appsec_config.config_id
  default_settings       = true
  security_policy_name   = "knagula-TF-Test-Policy"
  security_policy_prefix = "tf01"
}

# appsec security policy
resource "akamai_appsec_security_policy" "knagula-appsec-secpolicy-dup" {
  config_id              = data.akamai_appsec_configuration.knagula_appsec_config.config_id
  default_settings       = true
  security_policy_name   = "knagula-TF-Test-Policy-Dup"
  security_policy_prefix = "tf02"
}