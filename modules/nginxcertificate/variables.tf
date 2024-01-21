variable "nginxaas_deployment_id" {
  description = "NGINXaaS deployment ID"
  type = string
  default = "nginxaasdeploymentid"
}

variable "kv_secret_id" {
  description = "The Key Vault Secrete ID for the example certificate"
  type = string
  default = "keyvaultsecreteid"
}