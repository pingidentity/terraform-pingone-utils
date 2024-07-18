variable "region_code" {
  description = "A string that represents the PingOne region where the environment will be created. Valid values are API codes `NA`, `EU`, `CA`, `AP`, `AU` or their top level domain `com`, `eu`, `ca`, `asia`, `com.au`.  This value can be obtained from `region` parameter of the `pingone_environment` resource or data source."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["NA", "EU", "CA", "AP", "AU", "COM", "ASIA", "COM.AU"], upper(var.region_code))
    error_message = "The region value must be one of API codes `NA`, `EU`, `CA`, `AP`, `AU` or their top level domain `com`, `eu`, `ca`, `asia`, `com.au`."
  }
}

variable "environment_id" {
  description = "A string that represents the PingOne environment ID in UUID format.  This value can be obtained from `id` parameter of the `pingone_environment` resource or data source."
  type        = string

  validation {
    condition     = var.environment_id != null && can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.environment_id))
    error_message = "The environment_id value must be a valid PingOne resource ID, which is a UUID format."
  }
}

variable "custom_domain" {
  description = "A string that represents a custom domain intended to be configured in the PingOne environment. For example,: `auth.bxretail.org`."
  type        = string
  default     = null

  validation {
    condition     = var.custom_domain == null || (var.custom_domain != null && can(regex("^(?:[\\w-]+\\.)+[a-z]{2,}(?:\\/[\\w-]+)*(?:\\/[\\w.-]+)?\\/?(?:\\?.*)?$", var.custom_domain)))
    error_message = "The custom_domain value must be a valid domain."
  }
}
