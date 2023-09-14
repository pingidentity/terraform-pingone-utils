locals {

  region         = upper(trimspace(var.region == null ? "" : var.region))
  custom_domain  = lower(trimspace(var.custom_domain == null ? "" : var.custom_domain))
  environment_id = lower(trimspace(var.environment_id == null ? "" : var.environment_id))

  ###########################################
  # Region Expressions
  ###########################################
  is_north_america = (local.region == "NORTHAMERICA" || local.region == "NA" || local.region == "COM")
  is_europe        = (local.region == "EUROPE" || local.region == "EU")
  is_canada        = (local.region == "CANADA" || local.region == "CA")
  is_asia_pacific  = (local.region == "ASIAPACIFIC" || local.region == "AP" || local.region == "ASIA")

  ###########################################
  # Domain Suffixes
  ###########################################
  pingone_url_pingone_url_domain_suffix_north_america = local.is_north_america ? "com" : ""
  pingone_url_pingone_url_domain_suffix_europe        = local.is_europe ? "eu" : ""
  pingone_url_pingone_url_domain_suffix_canada        = local.is_canada ? "ca" : ""
  pingone_url_pingone_url_domain_suffix_asia_pacific  = local.is_asia_pacific ? "asia" : ""
  pingone_url_domain_suffix                           = coalesce(local.pingone_url_pingone_url_domain_suffix_north_america, local.pingone_url_pingone_url_domain_suffix_europe, local.pingone_url_pingone_url_domain_suffix_canada, local.pingone_url_pingone_url_domain_suffix_asia_pacific)

  ###########################################
  # Domains
  ###########################################
  pingone_url_auth_domain                     = coalesce(local.custom_domain, format("auth.pingone.%s", local.pingone_url_domain_suffix))
  pingone_url_api_domain                      = format("api.pingone.%s", local.pingone_url_domain_suffix)
  pingone_url_orchestrate_api_domain          = format("orchestrate-api.pingone.%s", local.pingone_url_domain_suffix)
  pingone_url_scim_api_domain                 = format("scim-api.pingone.%s", local.pingone_url_domain_suffix)
  pingone_url_agreement_management_api_domain = format("agreement-mgmt.pingone.%s", local.pingone_url_domain_suffix)
  pingone_url_console_domain                  = format("console.pingone.%s", local.pingone_url_domain_suffix)
  pingone_url_apps_domain                     = format("apps.pingone.%s", local.pingone_url_domain_suffix)

  ###########################################
  # Base Paths
  ###########################################
  pingone_url_auth_path                     = local.custom_domain != "" ? format("https://%s", local.pingone_url_auth_domain) : format("https://%s", local.pingone_url_auth_domain)
  pingone_url_auth_path_full                     = format("%s/%s", local.pingone_url_auth_path, local.environment_id)
  pingone_url_api_path                      = format("https://%s", local.pingone_url_api_domain)
  pingone_url_orchestrate_api_path          = format("https://%s", local.pingone_url_orchestrate_api_domain)
  pingone_url_scim_api_path                 = format("https://%s", local.pingone_url_scim_api_domain)
  pingone_url_agreement_management_api_path = format("https://%s", local.pingone_url_agreement_management_api_domain)
  pingone_url_console_path                  = format("https://%s", local.pingone_url_console_domain)
  pingone_url_apps_path                     = format("https://%s", local.pingone_url_apps_domain)

  ###########################################
  # Base Paths (v1) Paths
  ###########################################
  pingone_url_api_path_v1             = format("%s/v1", local.pingone_url_api_path)
  pingone_url_orchestrate_api_path_v1 = format("%s/v1", local.pingone_url_orchestrate_api_path)
  pingone_url_scim_api_path_v1        = format("%s/v1", local.pingone_url_scim_api_path)

  ###########################################
  # System Application Endpoints
  ###########################################
  pingone_environment_console_login_endpoint      = format("%s?env=%s", local.pingone_url_console_path, local.environment_id)
  pingone_environment_self_service_endpoint       = format("%s/%s/myaccount/", local.pingone_url_apps_path, local.environment_id)
  pingone_environment_application_portal_endpoint = format("%s/%s/myapps/", local.pingone_url_apps_path, local.environment_id)

  ###########################################
  # PingOne Environment application integration endpoints
  ###########################################
  pingone_environment_authorization_endpoint       = format("%s/as/authorize", local.pingone_url_auth_path_full)
  pingone_environment_par_endpoint                 = format("%s/as/par", local.pingone_url_auth_path_full)
  pingone_environment_token_endpoint               = format("%s/as/token", local.pingone_url_auth_path_full)
  pingone_environment_jwks_endpoint                = format("%s/as/jwks", local.pingone_url_auth_path_full)
  pingone_environment_userinfo_endpoint            = format("%s/as/userinfo", local.pingone_url_auth_path_full)
  pingone_environment_signoff_endpoint             = format("%s/as/signoff", local.pingone_url_auth_path_full)
  pingone_environment_oidc_discovery_endpoint      = format("%s/as/.well-known/openid-configuration", local.pingone_url_auth_path_full)
  pingone_environment_token_introspection_endpoint = format("%s/as/introspect", local.pingone_url_auth_path_full)
  pingone_environment_token_revokation_endpoint    = format("%s/as/revoke", local.pingone_url_auth_path_full)
  pingone_environment_issuer                       = format("%s/as", local.pingone_url_auth_path_full)

  ###########################################
  # DaVinci Connector Region Code
  ###########################################
  pingone_davinci_connector_region_code_north_america = local.is_north_america ? "NA" : ""
  pingone_davinci_connector_region_code_europe        = local.is_europe ? "EU" : ""
  pingone_davinci_connector_region_code_canada        = local.is_canada ? "CA" : ""
  pingone_davinci_connector_region_code_asia_pacific  = local.is_asia_pacific ? "AP" : ""
  pingone_davinci_connector_region_code               = coalesce(local.pingone_davinci_connector_region_code_north_america, local.pingone_davinci_connector_region_code_europe, local.pingone_davinci_connector_region_code_canada, local.pingone_davinci_connector_region_code_asia_pacific)

  ###########################################
  # PingOne Role Name Constants
  ###########################################
  pingone_role_name_client_application_developer          = "Client Application Developer"
  pingone_role_name_configuration_read_only               = "Configuration Read Only"
  pingone_role_name_davinci_admin                         = "DaVinci Admin"
  pingone_role_name_davinci_admin_read_only               = "DaVinci Admin Read Only"
  pingone_role_name_environment_admin                     = "Environment Admin"
  pingone_role_name_identity_data_admin                   = "Identity Data Admin"
  pingone_role_name_identity_data_read_only               = "Identity Data Read Only"
  pingone_role_name_organization_admin                    = "Organization Admin"
  pingone_role_name_pingfederate_administrator            = "PingFederate Administrator"
  pingone_role_name_pingfederate_auditor                  = "PingFederate Auditor"
  pingone_role_name_pingfederate_crypto_administrator     = "PingFederate Crypto Administrator"
  pingone_role_name_pingfederate_expression_administrator = "PingFederate Expression Administrator"
  pingone_role_name_pingfederate_user_administrator       = "PingFederate User Administrator"

  ###########################################
  # PingOne Resource Name Constants
  ###########################################
  pingone_resource_name_openid_connect = "openid"
  pingone_resource_name_pingone_api    = "PingOne API"

  ###########################################
  # PingOne Resource Scope Name Constants
  ###########################################
  pingone_resource_scope_name_openid_address = "address"
  pingone_resource_scope_name_openid_email   = "email"
  pingone_resource_scope_name_openid_phone   = "phone"
  pingone_resource_scope_name_openid_profile = "profile"

  pingone_resource_scope_name_pingone_api_create_device             = "p1:create:device"
  pingone_resource_scope_name_pingone_api_create_pairingkey         = "p1:create:pairingKey"
  pingone_resource_scope_name_pingone_api_delete_device             = "p1:delete:device"
  pingone_resource_scope_name_pingone_api_delete_pairingkey         = "p1:delete:pairingKey"
  pingone_resource_scope_name_pingone_api_delete_sessions           = "p1:delete:sessions"
  pingone_resource_scope_name_pingone_api_delete_userlinkedaccounts = "p1:delete:userLinkedAccounts"
  pingone_resource_scope_name_pingone_api_read_device               = "p1:read:device"
  pingone_resource_scope_name_pingone_api_read_oauthconsent         = "p1:read:oauthConsent"
  pingone_resource_scope_name_pingone_api_read_pairingkey           = "p1:read:pairingKey"
  pingone_resource_scope_name_pingone_api_read_sessions             = "p1:read:sessions"
  pingone_resource_scope_name_pingone_api_read_user                 = "p1:read:user"
  pingone_resource_scope_name_pingone_api_read_userconsent          = "p1:read:userConsent"
  pingone_resource_scope_name_pingone_api_read_userlinkedaccounts   = "p1:read:userLinkedAccounts"
  pingone_resource_scope_name_pingone_api_read_userpassword         = "p1:read:userPassword"
  pingone_resource_scope_name_pingone_api_reset_userpassword        = "p1:reset:userPassword"
  pingone_resource_scope_name_pingone_api_update_device             = "p1:update:device"
  pingone_resource_scope_name_pingone_api_update_oauthconsent       = "p1:update:oauthConsent"
  pingone_resource_scope_name_pingone_api_update_user               = "p1:update:user"
  pingone_resource_scope_name_pingone_api_update_usermfaenabled     = "p1:update:userMfaEnabled"
  pingone_resource_scope_name_pingone_api_validate_userpassword     = "p1:validate:userPassword"
  pingone_resource_scope_name_pingone_api_verify_user               = "p1:verify:user"

  ###########################################
  # PingOne Self-Service Capability Scopes
  ###########################################
  pingone_self_service_capability_scopes_manage_authentication = [
    local.pingone_resource_scope_name_pingone_api_create_device,
    local.pingone_resource_scope_name_pingone_api_create_pairingkey,
    local.pingone_resource_scope_name_pingone_api_delete_device,
    local.pingone_resource_scope_name_pingone_api_read_device,
    local.pingone_resource_scope_name_pingone_api_read_pairingkey,
    local.pingone_resource_scope_name_pingone_api_update_device,
  ]
  pingone_self_service_capability_scopes_manage_linked_accounts = [
    local.pingone_resource_scope_name_pingone_api_delete_userlinkedaccounts,
    local.pingone_resource_scope_name_pingone_api_read_userlinkedaccounts,
  ]
  pingone_self_service_capability_scopes_manage_mfa = [
    local.pingone_resource_scope_name_pingone_api_update_usermfaenabled,
  ]
  pingone_self_service_capability_scopes_manage_oauth_consents = [
    local.pingone_resource_scope_name_pingone_api_read_oauthconsent,
    local.pingone_resource_scope_name_pingone_api_update_oauthconsent,
  ]
  pingone_self_service_capability_scopes_manage_password = [
    local.pingone_resource_scope_name_pingone_api_read_userpassword,
    local.pingone_resource_scope_name_pingone_api_reset_userpassword,
    local.pingone_resource_scope_name_pingone_api_validate_userpassword,
  ]
  pingone_self_service_capability_scopes_manage_profile = [
    local.pingone_resource_scope_name_pingone_api_read_user,
    local.pingone_resource_scope_name_pingone_api_update_user,
  ]
  pingone_self_service_capability_scopes_manage_sessions = [
    local.pingone_resource_scope_name_pingone_api_delete_sessions,
    local.pingone_resource_scope_name_pingone_api_read_sessions,
  ]
  pingone_self_service_capability_scopes_view_agreements = [
    local.pingone_resource_scope_name_pingone_api_read_userconsent
  ]
}

###########################################
# PingOne Roles
# TODO: Consolidate to a `pingone_roles` data source and use expressions to select the appropriate role
###########################################
data "pingone_role" "client_application_developer" {
  name = local.pingone_role_name_client_application_developer
}

data "pingone_role" "configuration_read_only" {
  name = local.pingone_role_name_configuration_read_only
}

data "pingone_role" "davinci_admin" {
  name = local.pingone_role_name_davinci_admin
}

data "pingone_role" "davinci_admin_read_only" {
  name = local.pingone_role_name_davinci_admin_read_only
}

data "pingone_role" "environment_admin" {
  name = local.pingone_role_name_environment_admin
}

data "pingone_role" "identity_data_admin" {
  name = local.pingone_role_name_identity_data_admin
}

data "pingone_role" "identity_data_read_only" {
  name = local.pingone_role_name_identity_data_read_only
}

data "pingone_role" "organization_admin" {
  name = local.pingone_role_name_organization_admin
}

data "pingone_role" "pingfederate_administrator" {
  name = local.pingone_role_name_pingfederate_administrator
}

data "pingone_role" "pingfederate_auditor" {
  name = local.pingone_role_name_pingfederate_auditor
}

data "pingone_role" "pingfederate_crypto_administrator" {
  name = local.pingone_role_name_pingfederate_crypto_administrator
}

data "pingone_role" "pingfederate_expression_administrator" {
  name = local.pingone_role_name_pingfederate_expression_administrator
}

data "pingone_role" "pingfederate_user_administrator" {
  name = local.pingone_role_name_pingfederate_user_administrator
}

