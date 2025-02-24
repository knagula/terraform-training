variable "edgerc_path" {
  type        = string
  description = "edgerc path"
  default = "~/.edgerc"
}

variable "config_section" {
  type        = string
  description = "config section"
  default = "default"
}

# variable "client_secret" {}
# variable "host" {}
# variable "access_token" {}
# variable "client_token" {}

variable "ab_test" {
  type        = string
  description = "conditional testing"
  default = "A"
}

variable "apps" {
  default = [ "www", "api", "blog", "shop", "cdn"]
}