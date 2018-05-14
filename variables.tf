variable "name" {
  description = "Sub Domain of your Site"
}

variable "domain" {
  description = "Domain Name of the site you want to deploy. Prefix with `.`"
}

variable "zoneid" {
  description = "Hosted ZoneID of your Route53 Zone"
}

variable "tldn" {
  description = "Specify if the site you are creating is a TLDN or a subdomain. Default is False"
  default     = false
}
