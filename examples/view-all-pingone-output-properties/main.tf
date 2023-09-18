module "pingone_utils" {
  source = "pingidentity/utils/pingone"

  region         = pingone_environment.my_environment.region
  environment_id = pingone_environment.my_environment.id
  # custom_domain = "auth.bxretail.org"
}
