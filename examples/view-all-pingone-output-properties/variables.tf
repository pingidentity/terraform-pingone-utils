variable "pingone_environment_license_id" {
  description = "The license ID to use for the PingOne environment.  For more information about finding the license ID, see https://terraform.pingidentity.com/getting-started/pingone/#finding-required-ids"
  type        = string

  validation {
    condition     = var.pingone_environment_license_id != null && can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.pingone_environment_license_id))
    error_message = "The pingone_environment_license_id value must be a valid PingOne resource ID, which is a UUID format."
  }
}
