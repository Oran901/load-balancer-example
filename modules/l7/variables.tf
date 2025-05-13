variable "project" {
  description = "The name for generic stuff"
  type        = string
  default     = "yada"
}

variable "domain_name" {
  description = "domain name"
  type        = string
}

variable "type" {
  description = "load balancer layer (for helm chart to use alb or ingress-nginx)"
  type        = string
}

