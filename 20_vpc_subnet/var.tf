variable "region" {
  description = "Default region"
  type        = string
  default     = "ap-southeast-1"
}

variable "keyname" {
  description = "Name of keypair"
  type        = string
  default     = "sshkey"
}