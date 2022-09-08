variable "keys" {
  description = "Set of keypair names"
  type        = map
  default     = {
    keyA = "bastion_key",
    keyB = "db_key"
  }
}
variable "region" {
  description = "Region"
  type        = string
  default = "ap-southeast-1"
}