# PingOne Utilities Module Example: View all PingOne Output Properties

This example shows the full list of outputs of the module.

The following example:
1. Creates a demo PingOne environment named **Example Module - utils - view-all-pingone-output-properties**.
2. Prints the full list of resulting outputs from the utilities module.

## Before you begin

* A PingOne account configured for Terraform access.  For more information, see [Getting Started - PingOne](https://terraform.pingidentity.com/getting-started/pingone/)

## Setting Connection Details
The following environment variables should be set prior to running the example.  For more information, see the registry documentation for each provider.

| Variable name                                   | Schema Documentation                                                                                                | Required/Optional |
|-------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|-------------------|
| `PINGONE_CLIENT_ID`                             | [PingOne - client_id](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs#client_id)           | Required          |
| `PINGONE_CLIENT_SECRET`                         | [PingOne - client_secret](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs#client_secret)   | Required          |
| `PINGONE_ENVIRONMENT_ID`                        | [PingOne - environment_id](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs#environment_id) | Required          |
| `PINGONE_REGION`                                | [PingOne - region](https://registry.terraform.io/providers/pingidentity/pingone/latest/docs#region)                 | Required          |

## Setting Variables
The following variables can be set prior to running the example:

| Variable name                        | Required | Data Type | Default Value | Example Value                      | Description                                                                                                                                 |
|--------------------------------------|----------|-----------|---------------|------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| `pingone_environment_license_id`     | Yes      | String    | *no default*  |                                    | A valid license UUID to apply to the new environment. See [Finding Required IDs](https://terraform.pingidentity.com/getting-started/pingone/#license-id-organization-id-and-organization-name) for instructions on how to retrieve the `pingone_environment_license_id` value from the PingOne console. |
| `pingone_environment_name`           | No       | String    | `Example Module - utils - view-all-pingone-output-properties` | `My Environment` | A string that represents the name of the PingOne customer environment to create and manage with Terraform. |
| `append_date_to_environment_name`    | No       | Boolean   | `true`  | `true`                             | A boolean that determines whether to append the current date to the pingone_environment_name value.                                         |

## Outputs
The following outputs are returned from the example:

| Variable name                                             | Data Type | Sensitive Value | Description                                                                                                      |
|-----------------------------------------------------------|-----------|-----------------|------------------------------------------------------------------------------------------------------------------|
| `pingone_environment_name`          | String    | No             | The environment name created by the example          |
| `all_pingone_utils_outputs`      | Object    | No              | The full return object from the utilities module, showing all available outputs that can be used in customer HCL code. |

## Running the Example
Use the following to run the Terraform example:

```shell
terraform init
```

```shell
terraform plan -out infra.tfout
```

```shell
terraform apply "infra.tfout"
```


To clean up deployed resources, run the `destroy` command:

```shell
terraform destroy
```
