resource "aws_vpc" "test-vpc" {
  cidr_block           = "10.20.0.0/16"
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "TestVPC"
  }
}
