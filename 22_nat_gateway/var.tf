variable "region" {
  description = "Default region"
  type        = string
  default     = "ap-southeast-1"
}

variable "bastionkey" {
  description = "Name of keypair of bastion host"
  type        = string
  default     = "bastionkey"
}

variable "privatekey" {
  description = "Name of keypair of private instance"
  type        = string
  default     = "privatekey"
}