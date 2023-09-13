variable "region" {
  description = "A string that represents the PingOne region where the environment will be created. Valid values are `NorthAmerica`, `Europe`, `Canada`, `AsiaPacific` or their API codes `NA`, `EU`, `CA`, `AP`.  This value can be obtained from `region` parameter of the `pingone_environment` resource or data source."
  type        = string
  nullable    = false

  validation {
    condition     = contains(["NORTHAMERICA", "EUROPE", "CANADA", "ASIAPACIFIC", "NA", "EU", "CA", "AP"], upper(var.region))
    error_message = "The region value must be one of `NorthAmerica`, `Europe`, `Canada`, `AsiaPacific` or their API codes `NA`, `EU`, `CA`, `AP`."
  }
}

variable "environment_id" {
  description = "A string that represents the PingOne environment ID in UUID format. One of `environment_id` or `custom_domain` must be configured to compute the URLs needed for client application integration (such as the authorization, token, userinfo and well-known endpoints).  This value can be obtained from `id` parameter of the `pingone_environment` resource or data source."
  type        = string
  default     = null

  validation {
    condition     = var.environment_id == null || (var.environment_id != null && can(regex("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$", var.environment_id)))
    error_message = "The environment_id value must be a valid PingOne resource ID, which is a UUID format."
  }
}

variable "custom_domain" {
  description = "A string that represents a custom domain intended to be configured in the PingOne environment. For example,: `auth.bxretail.org`.  One of `environment_id` or `custom_domain` must be configured to compute the URLs needed for client application integration (such as the authorization, token, userinfo and well-known endpoints)."
  type        = string
  default     = null

  validation {
    condition     = var.custom_domain == null || (var.custom_domain != null && can(regex("^(?:[\\w-]+\\.)+[a-z]{2,}(?:\\/[\\w-]+)*(?:\\/[\\w.-]+)?\\/?(?:\\?.*)?$", var.custom_domain)))
    error_message = "The custom_domain value must be a valid domain."
  }
}
