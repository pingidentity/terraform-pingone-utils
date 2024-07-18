terraform {
  required_version = ">= 1.2"

  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
      version = ">= 1.0.0, < 2.0.0"
    }
  }
}
