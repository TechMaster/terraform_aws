locals {
  issued_ssl = data.aws_acm_certificate.amazon_issued
}

output "amazon_issued_ssl" {
  value =  {arn = local.issued_ssl.arn, domain = local.issued_ssl.domain}
}