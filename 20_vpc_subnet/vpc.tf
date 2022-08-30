resource "aws_vpc" "test-vpc" {
  cidr_block           = "10.20.0.0/16"
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    Name = "TestVPC"
  }
}
/* When you create a VPC, you must specify a range of IPv4 addresses for the VPC in the form of a 
Classless Inter-Domain Routing (CIDR) block. For example, 10.0.0.0/16. This is the primary CIDR block 
for your VPC. 

A VPC spans all of the Availability Zones in the Region. The following diagram shows a new VPC. 
After you create a VPC, you can add one or more subnets in each Availability Zone. For more information, 
see Subnets for your VPC.
*/

