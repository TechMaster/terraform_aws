variable "stage" {
  description = "stage of code"
  type        = string
  default     = "dev"
}

variable "keyname" {
  description = "Name of keypair"
  type        = string
  default     = "deployer-one"
}