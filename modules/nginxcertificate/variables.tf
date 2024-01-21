# Create a variable to contain the NGINXaaS deployment ID"
variable "nginxaas_deployment_id" {
  description = "NGINXaaS deployment ID"
  type = string
  default = "nginxaasdeploymentid"
}

# Create a variable to contain the NGINXaaS deployment ID"
variable "kv_secret_id" {
  description = "The Key Vault Secrete ID for the example certificate"
  type = string
  default = "keyvaultsecreteid"
}