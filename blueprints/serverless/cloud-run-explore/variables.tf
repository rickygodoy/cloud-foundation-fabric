variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "region" {
  description = "Cloud region where resource will be deployed"
  type        = string
  default     = "europe-west1"
}

variable "run_svc_name" {
  description = "Cloud Run service name"
  type        = string
  default     = "hello"
}

variable "image" {
  description = "Container image to deploy"
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
}

variable "custom_domain" {
  description = "Custom domain for the Load Balancer"
  type        = string
  default     = null
}

variable "ingress_settings" {
  description = "Ingress traffic sources allowed to call the service"
  type        = string
  default     = "all"
}

variable "security_policy" {
  description = "Security policy (Cloud Armor) to enforce in the LB"
  type = object({
    enabled      = optional(bool, false)
    ip_blacklist = optional(list(string), ["*"])
    path_blocked = optional(string, "/login.html")
  })
  default = {}
}

variable "iap" {
  description = "Identity-Aware Proxy for Cloud Run in the LB"
  type = object({
    enabled            = optional(bool, false)
    app_title          = optional(string, "Cloud Run Explore Application")
    oauth2_client_name = optional(string, "Test Client")
    email              = optional(string)
  })
  default = {}
}
