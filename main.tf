terraform {
  required_providers {
    fortios = {
      source  = "fortinetdev/fortios"
      version = "~> 1.22" # recent provider
    }
  }
}


provider "fortios" {
  hostname   = "192.168.16.1"
  token      = var.fortios_token
  insecure   = true
  vdom       = "root"
  http_proxy = ""   # force provider to avoid proxies
}

variable "fortios_token" {
  type      = string
  sensitive = true
}

# Minimal, harmless change: a test address object
resource "fortios_firewall_address" "tofu_test_host" {
  name   = "tofu-test-host"
  type   = "ipmask"
  subnet = "10.10.10.10/32"
  # If you didn't set provider.vdom above, add this line instead:
  # vdomparam = "root"
}
