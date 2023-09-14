###########################################
# Domain Suffixes
###########################################

output "pingone_domain_suffix" {
  description = "The domain suffix for the PingOne tenant.  Will be either `com`, `eu`, `ca` or `asia`."
  value       = local.pingone_url_domain_suffix
}

###########################################
# Domains
###########################################

output "pingone_url_auth_domain" {
  description = "The domain for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `auth.bxretail.org`.  Example result when a custom domain is not specified: `auth.pingone.com`."
  value       = local.pingone_url_auth_domain

  precondition {
    condition     = var.custom_domain != null || var.environment_id != null
    error_message = "The `custom_domain` or `environment_id` input variables must be set to calculate the environment's auth domain."
  }
}

output "pingone_url_api_domain" {
  description = "The domain for the PingOne tenant's API server.  Example result: `api.pingone.com`."
  value       = local.pingone_url_api_domain
}

output "pingone_url_orchestrate_api_domain" {
  description = "The domain for the PingOne tenant's Orchestrate API server.  Example result: `orchestrate-api.pingone.com`."
  value       = local.pingone_url_orchestrate_api_domain
}

output "pingone_url_scim_api_domain" {
  description = "The domain for the PingOne tenant's SCIM API server.  Example result: `scim-api.pingone.com`."
  value       = local.pingone_url_scim_api_domain
}

output "pingone_url_agreement_management_api_domain" {
  description = "The domain for the PingOne tenant's Agreement Management API server.  Example result: `agreement-mgmt.pingone.com`."
  value       = local.pingone_url_agreement_management_api_domain
}

###########################################
# Base Paths
###########################################

output "pingone_url_auth_path" {
  description = "The base path for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `https://auth.bxretail.org`.  Example result when a custom domain is not specified: `https://auth.pingone.com`."
  value       = local.pingone_url_auth_path
}

output "pingone_url_auth_path_full" {
  description = "The full base path for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `https://auth.bxretail.org`.  Example result when a custom domain is not specified: `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6`."
  value       = local.pingone_url_auth_path_full
}

output "pingone_url_api_path" {
  description = "The base path for the PingOne tenant's API server.  Example result: `https://api.pingone.com`."
  value       = local.pingone_url_api_path
}

output "pingone_url_orchestrate_api_path" {
  description = "The base path for the PingOne tenant's Orchestrate API server.  Example result: `https://orchestrate-api.pingone.com`."
  value       = local.pingone_url_orchestrate_api_path
}

output "pingone_url_scim_api_path" {
  description = "The base path for the PingOne tenant's SCIM API server.  Example result: `https://scim-api.pingone.com`."
  value       = local.pingone_url_scim_api_path
}

output "pingone_url_agreement_management_api_path" {
  description = "The base path for the PingOne tenant's Agreement Management API server.  Example result: `https://agreement-mgmt.pingone.com`."
  value       = local.pingone_url_agreement_management_api_path
}

output "pingone_url_console_path" {
  description = "The base path for the PingOne tenant's Console.  Example result: `https://console.pingone.com`."
  value       = local.pingone_url_console_path
}

output "pingone_url_apps_path" {
  description = "The base path for the PingOne tenant's Apps URL.  Example result: `https://apps.pingone.com`."
  value       = local.pingone_url_apps_path
}

###########################################
# Base Paths (v1) Paths
###########################################

output "pingone_url_api_path_v1" {
  description = "The base path for the PingOne tenant's API server (v1).  Example result: `https://api.pingone.com/v1`."
  value       = local.pingone_url_api_path_v1
}

output "pingone_url_orchestrate_api_path_v1" {
  description = "The base path for the PingOne tenant's Orchestrate API server (v1).  Example result: `https://orchestrate-api.pingone.com/v1`."
  value       = local.pingone_url_orchestrate_api_path_v1
}

output "pingone_url_scim_api_path_v1" {
  description = "The base path for the PingOne tenant's SCIM API server (v1).  Example result: `https://scim-api.pingone.com/v1`."
  value       = local.pingone_url_scim_api_path_v1
}

###########################################
# System Application Endpoints
###########################################
output "pingone_environment_console_login_endpoint" {
  description = "The PingOne administration console login endpoint for the provided environment.  Example result: `https://console.pingone.com/?env=46fb6778-b9d9-4349-a39d-7078d60e06b6`."
  value       = local.pingone_environment_console_login_endpoint
}

output "pingone_environment_self_service_endpoint" {
  description = "The PingOne Self-Service application endpoint for the provided environment.  Example result: `https://apps.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/myaccount/`."
  value       = local.pingone_environment_self_service_endpoint
}

output "pingone_environment_application_portal_endpoint" {
  description = "The PingOne Application Portal endpoint for the provided environment.  Example result: `https://apps.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/myapps/`."
  value       = local.pingone_environment_application_portal_endpoint
}

###########################################
# PingOne Environment application integration endpoints
###########################################

output "pingone_environment_authorization_endpoint" {
  description = "The authorization endpoint for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `https://auth.bxretail.org/as/authorize`.  Example result when a custom domain is not specified: `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/authorize`."
  value       = local.pingone_environment_authorization_endpoint
}

output "pingone_environment_par_endpoint" {
  description = "The Pushed Authorization Request (PAR) endpoint for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `https://auth.bxretail.org/as/par`.  Example result when a custom domain is not specified: `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/par`."
  value       = local.pingone_environment_par_endpoint
}

output "pingone_environment_token_endpoint" {
  description = "The token endpoint for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `https://auth.bxretail.org/as/token`.  Example result when a custom domain is not specified: `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/token`."
  value       = local.pingone_environment_token_endpoint
}

output "pingone_environment_jwks_endpoint" {
  description = "The JWKS endpoint for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `https://auth.bxretail.org/as/jwks`.  Example result when a custom domain is not specified: `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/jwks`."
  value       = local.pingone_environment_jwks_endpoint
}

output "pingone_environment_userinfo_endpoint" {
  description = "The userinfo endpoint for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `https://auth.bxretail.org/as/userinfo`.  Example result when a custom domain is not specified: `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/userinfo`."
  value       = local.pingone_environment_userinfo_endpoint
}

output "pingone_environment_signoff_endpoint" {
  description = "The signoff endpoint for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `https://auth.bxretail.org/as/signoff`.  Example result when a custom domain is not specified: `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/signoff`."
  value       = local.pingone_environment_signoff_endpoint
}

output "pingone_environment_oidc_discovery_endpoint" {
  description = "The OIDC discovery endpoint for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `https://auth.bxretail.org/as/.well-known/openid-configuration`.  Example result when a custom domain is not specified: `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/.well-known/openid-configuration`."
  value       = local.pingone_environment_oidc_discovery_endpoint
}

output "pingone_environment_token_introspection_endpoint" {
  description = "The token introspection endpoint for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `https://auth.bxretail.org/as/introspect`.  Example result when a custom domain is not specified: `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/introspect`."
  value       = local.pingone_environment_token_introspection_endpoint
}

output "pingone_environment_token_revokation_endpoint" {
  description = "The token revokation endpoint for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `https://auth.bxretail.org/as/revoke`.  Example result when a custom domain is not specified: `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/revoke`."
  value       = local.pingone_environment_token_revokation_endpoint
}

output "pingone_environment_issuer" {
  description = "The issuer for the PingOne tenant's authorization server.  Example result when a custom domain is specified: `https://auth.bxretail.org/as`.  Example result when a custom domain is not specified: `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as`."
  value       = local.pingone_environment_issuer
}

###########################################
# DaVinci Connector Region Code
###########################################

output "pingone_davinci_connector_region_code" {
  description = "The region code to use when configuring a DaVinci connector for the PingOne service.  Will be either `NA`, `EU`, `CA` or `AP`."
  value       = local.pingone_davinci_connector_region_code
}

###########################################
# PingOne Role Name Constants
###########################################

output "pingone_role_name_client_application_developer" {
  description = "The string constant representing the name of the PingOne role `Client Application Developer`."
  value       = local.pingone_role_name_client_application_developer
}

output "pingone_role_name_configuration_read_only" {
  description = "The string constant representing the name of the PingOne role `Configuration Read Only`."
  value       = local.pingone_role_name_configuration_read_only
}

output "pingone_role_name_davinci_admin" {
  description = "The string constant representing the name of the PingOne role `DaVinci Admin`."
  value       = local.pingone_role_name_davinci_admin
}

output "pingone_role_name_davinci_admin_read_only" {
  description = "The string constant representing the name of the PingOne role `DaVinci Admin Read Only`."
  value       = local.pingone_role_name_davinci_admin_read_only
}

output "pingone_role_name_environment_admin" {
  description = "The string constant representing the name of the PingOne role `Environment Admin`."
  value       = local.pingone_role_name_environment_admin
}

output "pingone_role_name_identity_data_admin" {
  description = "The string constant representing the name of the PingOne role `Identity Data Admin`."
  value       = local.pingone_role_name_identity_data_admin
}

output "pingone_role_name_identity_data_read_only" {
  description = "The string constant representing the name of the PingOne role `Identity Data Read Only`."
  value       = local.pingone_role_name_identity_data_read_only
}

output "pingone_role_name_organization_admin" {
  description = "The string constant representing the name of the PingOne role `Organization Admin`."
  value       = local.pingone_role_name_organization_admin
}

output "pingone_role_name_pingfederate_administrator" {
  description = "The string constant representing the name of the PingOne role `PingFederate Administrator`."
  value       = local.pingone_role_name_pingfederate_administrator
}

output "pingone_role_name_pingfederate_auditor" {
  description = "The string constant representing the name of the PingOne role `PingFederate Auditor`."
  value       = local.pingone_role_name_pingfederate_auditor
}

output "pingone_role_name_pingfederate_crypto_administrator" {
  description = "The string constant representing the name of the PingOne role `PingFederate Crypto Administrator`."
  value       = local.pingone_role_name_pingfederate_crypto_administrator
}

output "pingone_role_name_pingfederate_expression_administrator" {
  description = "The string constant representing the name of the PingOne role `PingFederate Expression Administrator`."
  value       = local.pingone_role_name_pingfederate_expression_administrator
}

output "pingone_role_name_pingfederate_user_administrator" {
  description = "The string constant representing the name of the PingOne role `PingFederate User Administrator`."
  value       = local.pingone_role_name_pingfederate_user_administrator
}

###########################################
# PingOne Role IDs
###########################################

output "pingone_role_id_client_application_developer" {
  description = "A string representing the PingOne resource ID of the role `Client Application Developer`."
  value       = data.pingone_role.client_application_developer.id
}

output "pingone_role_id_configuration_read_only" {
  description = "A string representing the PingOne resource ID of the role `Configuration Read Only`."
  value       = data.pingone_role.configuration_read_only.id
}

output "pingone_role_id_davinci_admin" {
  description = "A string representing the PingOne resource ID of the role `DaVinci Admin`."
  value       = data.pingone_role.davinci_admin.id
}

output "pingone_role_id_davinci_admin_read_only" {
  description = "A string representing the PingOne resource ID of the role `DaVinci Admin Read Only`."
  value       = data.pingone_role.davinci_admin_read_only.id
}

output "pingone_role_id_environment_admin" {
  description = "A string representing the PingOne resource ID of the role `Environment Admin`."
  value       = data.pingone_role.environment_admin.id
}

output "pingone_role_id_identity_data_admin" {
  description = "A string representing the PingOne resource ID of the role `Identity Data Admin`."
  value       = data.pingone_role.identity_data_admin.id
}

output "pingone_role_id_identity_data_read_only" {
  description = "A string representing the PingOne resource ID of the role `Identity Data Read Only`."
  value       = data.pingone_role.identity_data_read_only.id
}

output "pingone_role_id_organization_admin" {
  description = "A string representing the PingOne resource ID of the role `Organization Admin`."
  value       = data.pingone_role.organization_admin.id
}

output "pingone_role_id_pingfederate_administrator" {
  description = "A string representing the PingOne resource ID of the role `PingFederate Administrator`."
  value       = data.pingone_role.pingfederate_administrator.id
}

output "pingone_role_id_pingfederate_auditor" {
  description = "A string representing the PingOne resource ID of the role `PingFederate Auditor`."
  value       = data.pingone_role.pingfederate_auditor.id
}

output "pingone_role_id_pingfederate_crypto_administrator" {
  description = "A string representing the PingOne resource ID of the role `PingFederate Crypto Administrator`."
  value       = data.pingone_role.pingfederate_crypto_administrator.id
}

output "pingone_role_id_pingfederate_expression_administrator" {
  description = "A string representing the PingOne resource ID of the role `PingFederate Expression Administrator`."
  value       = data.pingone_role.pingfederate_expression_administrator.id
}

output "pingone_role_id_pingfederate_user_administrator" {
  description = "A string representing the PingOne resource ID of the role `PingFederate User Administrator`."
  value       = data.pingone_role.pingfederate_user_administrator.id
}

###########################################
# PingOne Resource Name Constants
###########################################

output "pingone_resource_name_openid_connect" {
  description = "A string constant `openid` that represents the OpenID Connect resource name in PingOne, useful when granting OpenID Connect resources and their scopes to applications using the `pingone_application_resource_grant` resource."
  value       = local.pingone_resource_name_openid_connect
}

output "pingone_resource_name_pingone_api" {
  description = "A string constant `PingOne API` that represents the PingOne API resource name in PingOne, useful when granting PingOne API resources and their scopes to applications using the `pingone_application_resource_grant` resource."
  value       = local.pingone_resource_name_pingone_api
}

###########################################
# PingOne Resource Scope Name Constants
###########################################

output "pingone_resource_scope_name_openid_address" {
  description = "The string constant representing the OpenID Connect scope name `address`."
  value       = local.pingone_resource_scope_name_openid_address
}

output "pingone_resource_scope_name_openid_email" {
  description = "The string constant representing the OpenID Connect scope name `email`."
  value       = local.pingone_resource_scope_name_openid_email
}

output "pingone_resource_scope_name_openid_phone" {
  description = "The string constant representing the OpenID Connect scope name `phone`."
  value       = local.pingone_resource_scope_name_openid_phone
}

output "pingone_resource_scope_name_openid_profile" {
  description = "The string constant representing the OpenID Connect scope name `profile`."
  value       = local.pingone_resource_scope_name_openid_profile
}

output "pingone_resource_scope_name_pingone_api_create_device" {
  description = "The string constant representing the PingOne API scope name `p1:create:device`."
  value       = local.pingone_resource_scope_name_pingone_api_create_device
}

output "pingone_resource_scope_name_pingone_api_create_pairingkey" {
  description = "The string constant representing the PingOne API scope name `p1:create:pairingKey`."
  value       = local.pingone_resource_scope_name_pingone_api_create_pairingkey
}

output "pingone_resource_scope_name_pingone_api_delete_device" {
  description = "The string constant representing the PingOne API scope name `p1:delete:device`."
  value       = local.pingone_resource_scope_name_pingone_api_delete_device
}

output "pingone_resource_scope_name_pingone_api_delete_pairingkey" {
  description = "The string constant representing the PingOne API scope name `p1:delete:pairingKey`."
  value       = local.pingone_resource_scope_name_pingone_api_delete_pairingkey
}

output "pingone_resource_scope_name_pingone_api_delete_sessions" {
  description = "The string constant representing the PingOne API scope name `p1:delete:sessions`."
  value       = local.pingone_resource_scope_name_pingone_api_delete_sessions
}

output "pingone_resource_scope_name_pingone_api_delete_userlinkedaccounts" {
  description = "The string constant representing the PingOne API scope name `p1:delete:userLinkedAccounts`."
  value       = local.pingone_resource_scope_name_pingone_api_delete_userlinkedaccounts
}

output "pingone_resource_scope_name_pingone_api_read_device" {
  description = "The string constant representing the PingOne API scope name `p1:read:device`."
  value       = local.pingone_resource_scope_name_pingone_api_read_device
}

output "pingone_resource_scope_name_pingone_api_read_oauthconsent" {
  description = "The string constant representing the PingOne API scope name `p1:read:oauthConsent`."
  value       = local.pingone_resource_scope_name_pingone_api_read_oauthconsent
}

output "pingone_resource_scope_name_pingone_api_read_pairingkey" {
  description = "The string constant representing the PingOne API scope name `p1:read:pairingKey`."
  value       = local.pingone_resource_scope_name_pingone_api_read_pairingkey
}

output "pingone_resource_scope_name_pingone_api_read_sessions" {
  description = "The string constant representing the PingOne API scope name `p1:read:sessions`."
  value       = local.pingone_resource_scope_name_pingone_api_read_sessions
}

output "pingone_resource_scope_name_pingone_api_read_user" {
  description = "The string constant representing the PingOne API scope name `p1:read:user`."
  value       = local.pingone_resource_scope_name_pingone_api_read_user
}

output "pingone_resource_scope_name_pingone_api_read_userconsent" {
  description = "The string constant representing the PingOne API scope name `p1:read:userConsent`."
  value       = local.pingone_resource_scope_name_pingone_api_read_userconsent
}

output "pingone_resource_scope_name_pingone_api_read_userlinkedaccounts" {
  description = "The string constant representing the PingOne API scope name `p1:read:userLinkedAccounts`."
  value       = local.pingone_resource_scope_name_pingone_api_read_userlinkedaccounts
}

output "pingone_resource_scope_name_pingone_api_read_userpassword" {
  description = "The string constant representing the PingOne API scope name `p1:read:userPassword`."
  value       = local.pingone_resource_scope_name_pingone_api_read_userpassword
}

output "pingone_resource_scope_name_pingone_api_reset_userpassword" {
  description = "The string constant representing the PingOne API scope name `p1:reset:userPassword`."
  value       = local.pingone_resource_scope_name_pingone_api_reset_userpassword
}

output "pingone_resource_scope_name_pingone_api_update_device" {
  description = "The string constant representing the PingOne API scope name `p1:update:device`."
  value       = local.pingone_resource_scope_name_pingone_api_update_device
}

output "pingone_resource_scope_name_pingone_api_update_oauthconsent" {
  description = "The string constant representing the PingOne API scope name `p1:update:oauthConsent`."
  value       = local.pingone_resource_scope_name_pingone_api_update_oauthconsent
}

output "pingone_resource_scope_name_pingone_api_update_user" {
  description = "The string constant representing the PingOne API scope name `p1:update:user`."
  value       = local.pingone_resource_scope_name_pingone_api_update_user
}

output "pingone_resource_scope_name_pingone_api_update_usermfaenabled" {
  description = "The string constant representing the PingOne API scope name `p1:update:userMfaEnabled`."
  value       = local.pingone_resource_scope_name_pingone_api_update_usermfaenabled
}

output "pingone_resource_scope_name_pingone_api_validate_userpassword" {
  description = "The string constant representing the PingOne API scope name `p1:validate:userPassword`."
  value       = local.pingone_resource_scope_name_pingone_api_validate_userpassword
}

output "pingone_resource_scope_name_pingone_api_verify_user" {
  description = "The string constant representing the PingOne API scope name `p1:verify:user`."
  value       = local.pingone_resource_scope_name_pingone_api_verify_user
}

###########################################
# PingOne Self-Service Capability Scopes
###########################################

output "pingone_self_service_capability_scopes_manage_authentication" {
  description = "A list of PingOne API scopes that correlate to the Authentication management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, authentication management features are enabled."
  value       = local.pingone_self_service_capability_scopes_manage_authentication
}

output "pingone_self_service_capability_scopes_manage_linked_accounts" {
  description = "A list of PingOne API scopes that correlate to the Linked Accounts management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, linked accounts management features are enabled."
  value       = local.pingone_self_service_capability_scopes_manage_linked_accounts
}

output "pingone_self_service_capability_scopes_manage_mfa" {
  description = "A list of PingOne API scopes that correlate to the MFA management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, MFA management features are enabled."
  value       = local.pingone_self_service_capability_scopes_manage_mfa
}

output "pingone_self_service_capability_scopes_manage_oauth_consents" {
  description = "A list of PingOne API scopes that correlate to the OAuth Consents management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, OAuth Consents management features are enabled."
  value       = local.pingone_self_service_capability_scopes_manage_oauth_consents
}

output "pingone_self_service_capability_scopes_manage_password" {
  description = "A list of PingOne API scopes that correlate to the Password management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, password management features are enabled."
  value       = local.pingone_self_service_capability_scopes_manage_password
}

output "pingone_self_service_capability_scopes_manage_profile" {
  description = "A list of PingOne API scopes that correlate to the Profile management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, profile management features are enabled."
  value       = local.pingone_self_service_capability_scopes_manage_profile
}

output "pingone_self_service_capability_scopes_manage_sessions" {
  description = "A list of PingOne API scopes that correlate to the Sessions management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, sessions management features are enabled."
  value       = local.pingone_self_service_capability_scopes_manage_sessions
}

output "pingone_self_service_capability_scopes_view_agreements" {
  description = "A list of PingOne API scopes that correlate to the Agreements management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, agreements management features are enabled."
  value       = local.pingone_self_service_capability_scopes_view_agreements
}
