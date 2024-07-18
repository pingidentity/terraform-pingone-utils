# PingOne Utilities Module

This module provides a set of commonly calculated variables (including URLs, hostnames) and constant values used in the PingOne platform, to be able to simplify the use of the PingOne Terraform provider.  The full list of provided outputs are listed below.

## Disclaimer - Module in Development

This Terraform module is still in development and considered early access.  Breaking changes are likely. Please use with caution.

## Usage

### With Custom Domain

```hcl
module "pingone_utils" {
  source = "pingidentity/utils/pingone"

  region_code    = pingone_environment.my_environment.region
  environment_id = pingone_environment.my_environment.id
  custom_domain  = "auth.bxretail.org"
}
```

### Without Custom Domain

```hcl
module "pingone_utils" {
  source = "pingidentity/utils/pingone"

  region_code    = pingone_environment.my_environment.region
  environment_id = pingone_environment.my_environment.id
}
```

## Outputs

### DaVinci Value Conversion

The following are calculated values that are needed to configure PingOne services in DaVinci.

| Module Output | Description | Example Result Value |
|---------------|-------------|----------------------|
| `pingone_davinci_connector_region_code` | The region code to use when configuring a DaVinci connector for the PingOne service.  Will be either `NA`, `EU`, `CA`, `AU` or `AP`. | `NA` |

### Platform Endpoint URLs, Base URLs and Domains

#### Application Integration Endpoint URLs

The following are calculated URLs that are needed to integrate customer applications with PingOne.  These values are calculated based on the `region`, `environment_id` and `custom_domain` inputs.

| Module Output | Description | Example Result Value with `custom_domain` input defined | Example Result Value without `custom_domain` input defined |
|---------------|-------------|---------------------------------------------------------|------------------------------------------------------------|
| `pingone_environment_authorization_endpoint` | The authorization endpoint for the PingOne tenant's authorization server. | `https://auth.bxretail.org/as/authorize` | `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/authorize` |
| `pingone_environment_issuer` | The issuer for the PingOne tenant's authorization server. | `https://auth.bxretail.org/as` | `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as` |
| `pingone_environment_jwks_endpoint` | The JWKS endpoint for the PingOne tenant's authorization server | `https://auth.bxretail.org/as/jwks` | `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/jwks` |
| `pingone_environment_oidc_discovery_endpoint` | The OIDC discovery endpoint for the PingOne tenant's authorization server. | `https://auth.bxretail.org/as/.well-known/openid-configuration` | `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/.well-known/openid-configuration` |
| `pingone_environment_par_endpoint` | The Pushed Authorization Request (PAR) endpoint for the PingOne tenant's authorization server | `https://auth.bxretail.org/as/par` | `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/par` |
| `pingone_environment_signoff_endpoint` | The signoff endpoint for the PingOne tenant's authorization server | `https://auth.bxretail.org/as/signoff` | `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/signoff` |
| `pingone_environment_token_endpoint` | The token endpoint for the PingOne tenant's authorization server. | `https://auth.bxretail.org/as/token` | `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/token` |
| `pingone_environment_token_introspection_endpoint` | The token introspection endpoint for the PingOne tenant's authorization server | `https://auth.bxretail.org/as/introspect` | `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/introspect` |
| `pingone_environment_token_revokation_endpoint` | The token revokation endpoint for the PingOne tenant's authorization server. | `https://auth.bxretail.org/as/revoke` | `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/revoke` |
| `pingone_environment_userinfo_endpoint` | The userinfo endpoint for the PingOne tenant's authorization server | `https://auth.bxretail.org/as/userinfo` | `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/as/userinfo` |

#### Platform Application Endpoint URLs

The following are calculated URLs for platform provided applications, including the Application Portal, Self-Service application and Administration Console.  These values are calculated based on the `region`, `environment_id` and `custom_domain` inputs.

| Module Output | Description | Example Result Value with `custom_domain` input defined | Example Result Value without `custom_domain` input defined |
|---------------|-------------|---------------------------------------------------------|------------------------------------------------------------|
| `pingone_environment_application_portal_endpoint` | The PingOne Application Portal endpoint for the provided environment. | `https://auth.bxretail.org/myapps/` | `https://apps.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/myapps/` |
| `pingone_environment_console_login_endpoint` | The PingOne administration console login endpoint for the provided environment. | `https://console.pingone.com/?env=46fb6778-b9d9-4349-a39d-7078d60e06b6` | `https://console.pingone.com/?env=46fb6778-b9d9-4349-a39d-7078d60e06b6` |
| `pingone_environment_self_service_endpoint` | The PingOne Self-Service application endpoint for the provided environment. | `https://auth.bxretail.org/myaccount/` | `https://apps.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6/myaccount/` |

#### Platform API URLs

The following are calculated URLs to interact with PingOne's administration and data API services.  These values are calculated based on the `region`, `environment_id` and `custom_domain` inputs.

| Module Output | Description | Example Result Value with `custom_domain` input defined | Example Result Value without `custom_domain` input defined |
|---------------|-------------|---------------------------------------------------------|------------------------------------------------------------|
| `pingone_domain_suffix` | The domain suffix for the PingOne tenant.  Will be either `com`, `eu`, `ca` `asia` or `com.au`. | `com` | `com` |
| `pingone_url_agreement_management_api_domain` | The domain for the PingOne tenant's Agreement Management API server. | `agreement-mgmt.pingone.com` | `agreement-mgmt.pingone.com` |
| `pingone_url_agreement_management_api_path` | The base path for the PingOne tenant's Agreement Management API server. | `https://agreement-mgmt.pingone.com` | `https://agreement-mgmt.pingone.com` |
| `pingone_url_api_domain` | The domain for the PingOne tenant's API server. | `api.pingone.com` | `api.pingone.com` |
| `pingone_url_api_path_v1` | The base path for the PingOne tenant's API server (v1). | `https://api.pingone.com/v1` | `https://api.pingone.com/v1` |
| `pingone_url_api_path` | The base path for the PingOne tenant's API server. | `https://api.pingone.com` | `https://api.pingone.com` |
| `pingone_url_apps_domain` | The domain for the PingOne tenant's Apps URL. | `auth.bxretail.org` | `apps.pingone.com` |
| `pingone_url_apps_path` | The base path for the PingOne tenant's Apps URL. | `https://auth.bxretail.org` | `https://apps.pingone.com` |
| `pingone_url_apps_path_full` | The full base path for the PingOne tenant's Apps URL. | `https://auth.bxretail.org` | `https://apps.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6` |
| `pingone_url_auth_domain` | The domain for the PingOne tenant's authorization server. | `auth.bxretail.org` | `auth.pingone.com` |
| `pingone_url_auth_path` | The base path for the PingOne tenant's authorization server. | `https://auth.bxretail.org` | `https://auth.pingone.com` |
| `pingone_url_auth_path_full` | The full base path for the PingOne tenant's authorization server. | `https://auth.bxretail.org` | `https://auth.pingone.com/46fb6778-b9d9-4349-a39d-7078d60e06b6` |
| `pingone_url_console_domain` | The domain for the PingOne tenant's Console. | `console.pingone.com` | `console.pingone.com` |
| `pingone_url_console_path` | The base path for the PingOne tenant's Console. | `https://console.pingone.com` | `https://console.pingone.com` |
| `pingone_url_orchestrate_api_domain` | The domain for the PingOne tenant's Orchestrate API server. | `orchestrate-api.pingone.com` | `orchestrate-api.pingone.com` |
| `pingone_url_orchestrate_api_path_v1` | The base path for the PingOne tenant's Orchestrate API server (v1). | `https://orchestrate-api.pingone.com/v1` | `https://orchestrate-api.pingone.com/v1` |
| `pingone_url_orchestrate_api_path` | The base path for the PingOne tenant's Orchestrate API server. | `https://orchestrate-api.pingone.com` | `https://orchestrate-api.pingone.com` |
| `pingone_url_scim_api_domain` | The domain for the PingOne tenant's SCIM API server. | `scim-api.pingone.com` | `scim-api.pingone.com` |
| `pingone_url_scim_api_path_v1` | The base path for the PingOne tenant's SCIM API server (v1). | `https://scim-api.pingone.com/v1` | `https://scim-api.pingone.com/v1` |
| `pingone_url_scim_api_path` | The base path for the PingOne tenant's SCIM API server. | `https://scim-api.pingone.com` | `https://scim-api.pingone.com` |

### Admin Roles

#### Admin Role IDs

The following are calculated PingOne resource IDs for each administration role in the PingOne platform.  These values are the equivalent of the `id` read-only attribute on the `pingone_role` data source and are retrieved using the PingOne provider's role data sources.

| Module Output | Description | Example Result Value |
|---------------|-------------|----------------------|
| `pingone_role_id_application_owner` | A string representing the PingOne resource ID of the role `Application Owner`. | `e5044093-3a97-4886-950c-2c501f8985d4` |
| `pingone_role_id_client_application_developer` | A string representing the PingOne resource ID of the role `Client Application Developer`. | `e5044093-3a97-4886-950c-2c501f8985d4` |
| `pingone_role_id_configuration_read_only` | A string representing the PingOne resource ID of the role `Configuration Read Only`. | `c0ed8595-2f18-4034-b0cf-aa2943b78c2f` |
| `pingone_role_id_davinci_admin_read_only` | A string representing the PingOne resource ID of the role `DaVinci Admin Read Only`. | `560bd896-6053-4d71-9e73-3d0b1e8f882e` |
| `pingone_role_id_davinci_admin` | A string representing the PingOne resource ID of the role `DaVinci Admin`. | `2c4a335b-97b2-405b-b34f-4943c03b1111` |
| `pingone_role_id_environment_admin` | A string representing the PingOne resource ID of the role `Environment Admin`. | `fc22d67f-3377-48b4-970c-ce648426fc2f` |
| `pingone_role_id_identity_data_admin` | A string representing the PingOne resource ID of the role `Identity Data Admin`. | `e71f2d5a-937c-4278-8c78-edd5a036bcc5` |
| `pingone_role_id_identity_data_read_only` | A string representing the PingOne resource ID of the role `Identity Data Read Only`. | `419117c9-011f-4482-8046-2f204259cdce` |
| `pingone_role_id_organization_admin` | "A string representing the PingOne resource ID of the role `Organization Admin`. | `2487c9d6-2186-42f7-87d9-6fb64b919bfb` |
| `pingone_role_id_pingfederate_administrator` | A string representing the PingOne resource ID of the role `PingFederate Administrator`. | `eb6e4409-d5ef-4536-8313-12ed9db4715a` |
| `pingone_role_id_pingfederate_auditor` | A string representing the PingOne resource ID of the role `PingFederate Auditor`. | `cf2b126a-bc3c-4607-a6c6-bf6974b7c890` |
| `pingone_role_id_pingfederate_crypto_administrator` | A string representing the PingOne resource ID of the role `PingFederate Crypto Administrator`. | `749811e9-18fb-4b5f-8af3-6d25fcdf837c` |
| `pingone_role_id_pingfederate_expression_administrator` | A string representing the PingOne resource ID of the role `PingFederate Expression Administrator`. | `8634cabf-2ddb-470d-a8ff-16082fbc62f0` |
| `pingone_role_id_pingfederate_user_administrator` | A string representing the PingOne resource ID of the role `PingFederate User Administrator`. | `cb42294d-be81-4aea-ad87-884d2ac43c65` |

#### Admin Role Name Constants

The following are constant values for the names of each administration role in the PingOne platform.  These values can be used as the `name` input parameter on the `pingone_role` data source.

| Module Output | Description | Example Result Value |
|---------------|-------------|----------------------|
| `pingone_role_name_application_owner` | The string constant representing the name of the PingOne role `Application Owner`. | `Application Owner` |
| `pingone_role_name_client_application_developer` | The string constant representing the name of the PingOne role `Client Application Developer`. | `Client Application Developer` |
| `pingone_role_name_configuration_read_only` | The string constant representing the name of the PingOne role `Configuration Read Only`. | `Configuration Read Only` |
| `pingone_role_name_davinci_admin_read_only` | The string constant representing the name of the PingOne role `DaVinci Admin Read Only`. | `DaVinci Admin Read Only` |
| `pingone_role_name_davinci_admin` | The string constant representing the name of the PingOne role `DaVinci Admin`. | `DaVinci Admin` |
| `pingone_role_name_environment_admin` | The string constant representing the name of the PingOne role `Environment Admin`. | `Environment Admin` |
| `pingone_role_name_identity_data_admin` | The string constant representing the name of the PingOne role `Identity Data Admin`. | `Identity Data Admin` |
| `pingone_role_name_identity_data_read_only` | The string constant representing the name of the PingOne role `Identity Data Read Only`. | `Identity Data Read Only` |
| `pingone_role_name_organization_admin` | The string constant representing the name of the PingOne role `Organization Admin`. | `Organization Admin` |
| `pingone_role_name_pingfederate_administrator` | The string constant representing the name of the PingOne role `PingFederate Administrator`. | `PingFederate Administrator` |
| `pingone_role_name_pingfederate_auditor` | The string constant representing the name of the PingOne role `PingFederate Auditor`. | `PingFederate Auditor` |
| `pingone_role_name_pingfederate_crypto_administrator` | The string constant representing the name of the PingOne role `PingFederate Crypto Administrator`. | `PingFederate Crypto Administrator` |
| `pingone_role_name_pingfederate_expression_administrator` | The string constant representing the name of the PingOne role `PingFederate Expression Administrator`. | `PingFederate Expression Administrator` |
| `pingone_role_name_pingfederate_user_administrator` | The string constant representing the name of the PingOne role `PingFederate User Administrator`. | `PingFederate User Administrator` |

### OpenID Connect / PingOne API Resource Name Constants

The following are constant values for the names of each PingOne Resource, the scopes of which are granted to applications.  These values can be used as the `resource_name` input parameter on the `pingone_application_role_assignment` resource, or the `name` input parameter for the `pingone_resource` data source.

| Module Output | Description | Example Result Value |
|---------------|-------------|----------------------|
| `pingone_resource_name_openid_connect` | A string constant `openid` that represents the OpenID Connect resource name in PingOne, useful when granting OpenID Connect resources and their scopes to applications using the `pingone_application_resource_grant` resource. | `openid` |
| `pingone_resource_name_pingone_api` | A string constant `PingOne API` that represents the PingOne API resource name in PingOne, useful when granting PingOne API resources and their scopes to applications using the `pingone_application_resource_grant` resource. | `PingOne API` |

### OpenID Connect / PingOne API Resource Scope Name Constants

The following are constant values for the names of each PingOne Resource Scope, which are granted to applications.  These values can be used in the `scope_names` input parameter on the `pingone_application_role_assignment` resource, or the `name` input parameter for the `pingone_resource_scope` data source.

| Module Output | Description | Example Result Value |
|---------------|-------------|----------------------|
| `pingone_resource_scope_name_openid_address` | The string constant representing the OpenID Connect scope name `address`. | `address` |
| `pingone_resource_scope_name_openid_email` | The string constant representing the OpenID Connect scope name `email`. | `email` |
| `pingone_resource_scope_name_openid_phone` | The string constant representing the OpenID Connect scope name `phone`. | `phone` |
| `pingone_resource_scope_name_openid_profile` | The string constant representing the OpenID Connect scope name `profile`. | `profile` |
| `pingone_resource_scope_name_pingone_api_create_device` | The string constant representing the PingOne API scope name `p1:create:device`. | `p1:create:device` |
| `pingone_resource_scope_name_pingone_api_create_pairingkey` | The string constant representing the PingOne API scope name `p1:create:pairingKey`. | `p1:create:pairingKey` |
| `pingone_resource_scope_name_pingone_api_delete_device` | The string constant representing the PingOne API scope name `p1:delete:device`. | `p1:delete:device` |
| `pingone_resource_scope_name_pingone_api_delete_pairingkey` | The string constant representing the PingOne API scope name `p1:delete:pairingKey`. | `p1:delete:pairingKey` |
| `pingone_resource_scope_name_pingone_api_delete_sessions` | The string constant representing the PingOne API scope name `p1:delete:sessions`. | `p1:delete:sessions` |
| `pingone_resource_scope_name_pingone_api_delete_userlinkedaccounts` | The string constant representing the PingOne API scope name `p1:delete:userLinkedAccounts`. | `p1:delete:userLinkedAccounts` |
| `pingone_resource_scope_name_pingone_api_read_device` | The string constant representing the PingOne API scope name `p1:read:device`. | `p1:read:device` |
| `pingone_resource_scope_name_pingone_api_read_oauthconsent` | The string constant representing the PingOne API scope name `p1:read:oauthConsent`. | `p1:read:oauthConsent` |
| `pingone_resource_scope_name_pingone_api_read_pairingkey` | The string constant representing the PingOne API scope name `p1:read:pairingKey`. | `p1:read:pairingKey` |
| `pingone_resource_scope_name_pingone_api_read_sessions` | The string constant representing the PingOne API scope name `p1:read:sessions`. | `p1:read:sessions` |
| `pingone_resource_scope_name_pingone_api_read_user` | The string constant representing the PingOne API scope name `p1:read:user`. | `p1:read:user` |
| `pingone_resource_scope_name_pingone_api_read_userconsent` | The string constant representing the PingOne API scope name `p1:read:userConsent`. | `p1:read:userConsent` |
| `pingone_resource_scope_name_pingone_api_read_userlinkedaccounts` | The string constant representing the PingOne API scope name `p1:read:userLinkedAccounts`. | `p1:read:userLinkedAccounts` |
| `pingone_resource_scope_name_pingone_api_read_userpassword` | The string constant representing the PingOne API scope name `p1:read:userPassword`. | `p1:read:userPassword` |
| `pingone_resource_scope_name_pingone_api_reset_userpassword` | The string constant representing the PingOne API scope name `p1:reset:userPassword`. | `p1:reset:userPassword` |
| `pingone_resource_scope_name_pingone_api_update_device` | The string constant representing the PingOne API scope name `p1:update:device`. | `p1:update:device` |
| `pingone_resource_scope_name_pingone_api_update_oauthconsent` | The string constant representing the PingOne API scope name `p1:update:oauthConsent`. | `p1:update:oauthConsent` |
| `pingone_resource_scope_name_pingone_api_update_user` | The string constant representing the PingOne API scope name `p1:update:user`. | `p1:update:user` |
| `pingone_resource_scope_name_pingone_api_update_usermfaenabled` | The string constant representing the PingOne API scope name `p1:update:userMfaEnabled`. | `p1:update:userMfaEnabled` |
| `pingone_resource_scope_name_pingone_api_validate_userpassword` | The string constant representing the PingOne API scope name `p1:validate:userPassword`. | `p1:validate:userPassword` |
| `pingone_resource_scope_name_pingone_api_verify_user` | The string constant representing the PingOne API scope name `p1:verify:user`. | `p1:verify:user` |

### Self-Service Application Capability Scopes

The following are constant list values of PingOne API scopes that enable specific features of the PingOne Self-Service application.  To enable/disable Self-Service application features, concatenate the following as needed (using the `concat()` function) and use the `pingone_application_role_assignment` resource to assign them to the Self-Service system application (the `pingone_system_application` resource).

| Module Output | Description | Example Result Value |
|---------------|-------------|----------------------|
| `pingone_self_service_capability_scopes_manage_authentication` | A list of PingOne API scopes that correlate to the Authentication management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, authentication management features are enabled. | <pre>[<br>  "p1:create:device",<br>  "p1:create:pairingKey",<br>  "p1:delete:device",<br>  "p1:read:device",<br>  "p1:read:pairingKey",<br>  "p1:update:device"<br>]</pre> |
| `pingone_self_service_capability_scopes_manage_linked_accounts` | A list of PingOne API scopes that correlate to the Linked Accounts management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, linked accounts management features are enabled. | <pre>[<br>  "p1:delete:userLinkedAccounts",<br>  "p1:read:userLinkedAccounts"<br>]</pre> |
| `pingone_self_service_capability_scopes_manage_mfa` | A list of PingOne API scopes that correlate to the MFA management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, MFA management features are enabled. | <pre>[<br>  "p1:update:userMfaEnabled"<br>]</pre> |
| `pingone_self_service_capability_scopes_manage_oauth_consents` | A list of PingOne API scopes that correlate to the OAuth Consents management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, OAuth Consents management features are enabled. | <pre>[<br>  "p1:read:oauthConsent",<br>  "p1:update:oauthConsent"<br>]</pre> |
| `pingone_self_service_capability_scopes_manage_password` | A list of PingOne API scopes that correlate to the Password management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, password management features are enabled. | <pre>[<br>  "p1:read:userPassword",<br>  "p1:reset:userPassword",<br>  "p1:validate:userPassword"<br>]</pre> |
| `pingone_self_service_capability_scopes_manage_profile` | A list of PingOne API scopes that correlate to the Profile management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, profile management features are enabled. | <pre>[<br>  "p1:read:user",<br>  "p1:update:user"<br>]</pre> |
| `pingone_self_service_capability_scopes_manage_sessions` | A list of PingOne API scopes that correlate to the Sessions management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, sessions management features are enabled. | <pre>[<br>  "p1:delete:sessions",<br>  "p1:read:sessions"<br>]</pre> |
| `pingone_self_service_capability_scopes_view_agreements` | A list of PingOne API scopes that correlate to the Agreements management features of the PingOne Self-Service application.  When these scopes are granted to the Self-Service application using the `pingone_application_resource_grant` resource, agreements management features are enabled. | <pre>[<br>  "p1:read:userConsent"<br>]</pre> |
