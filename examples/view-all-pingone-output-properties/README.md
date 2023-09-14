# PingOne Utilities Module Example: View all PingOne Output Properties

This example shows the full list of outputs of the module.

## Usage

Set the following variables to be able to authenticate to the PingOne provider, replacing the variable values with your own.  For more information about authenticating to the PingOne provider, see the [Terraform Registry Documentation](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs).
```shell
export PINGONE_ENVIRONMENT_ID=$PINGONE_ENVIRONMENT_ID
export PINGONE_CLIENT_ID=$PINGONE_CLIENT_ID
export PINGONE_CLIENT_SECRET=$PINGONE_CLIENT_SECRET
export PINGONE_REGION=$PINGONE_REGION
```

Set the following variables that are needed for the example code, replacing the variable values with your own.  For more information about finding the required IDs, see [Finding Required IDs](https://terraform.pingidentity.com/getting-started/pingone/#finding-required-ids):
```shell
export TF_VAR_pingone_environment_license_id=$LICENSE_ID
```

Then run the Terraform commands in your command line:

```shell
terraform init
terraform plan
terraform apply
```

To clean up deployed resources, run the `destroy` command:

```shell
terraform destroy
```
