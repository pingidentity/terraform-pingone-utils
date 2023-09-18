module "pingone_utils" {
  source = "pingidentity/utils/pingone"
  version = ">= 0.0.7"

  region         = pingone_environment.my_environment.region
  environment_id = pingone_environment.my_environment.id
  # custom_domain = "auth.bxretail.org"
}
