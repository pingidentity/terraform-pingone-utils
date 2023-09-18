output "all_pingone_utils_outputs" {
  description = "The full list of outputs from the PingOne utils module"
  value       = module.pingone_utils
}

output "pingone_environment_name" {
  description = "The environment name created by the PingOne module example"
  value       = pingone_environment.my_environment.name
}
