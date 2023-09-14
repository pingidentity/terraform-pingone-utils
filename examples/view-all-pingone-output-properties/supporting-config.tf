resource "pingone_environment" "my_environment" {
  name        = "Example Module - utils - view-all-pingone-output-properties"
  description = "My new environment to test the PingOne utils module example to display all output properties"
  type        = "SANDBOX"
  license_id  = var.pingone_environment_license_id

  default_population {}

  service {
    type = "SSO"
  }
}
