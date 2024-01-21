# Create a variable to contain the NGINXaaS deployment ID"
variable "nginxaas_deployment_id" {
  description = "NGINXaaS deployment ID"
  type = string
  default = "nginxaasdeploymentid"
}

variable "config_files" {
  description = "Config files and paths to include in the NGINXaaS configuration"
  type = map(object({
    content      = string
    virtual_path = string
  }))
}

variable "configure" {
  description = "Workaround for Bug ID-891. Set false to skip configuration."
  type        = bool
  default     = true
}