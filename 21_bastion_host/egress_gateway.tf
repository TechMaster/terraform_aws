resource "aws_egress_only_internet_gateway" "egress_interget_gateway" {
  vpc_id = aws_vpc.test-vpc.id

  tags = {
    Name = "egress_interget_gateway"
  }
}

/*
IPv6 addresses are globally unique, and are therefore public by default. 
If you want your instance to be able to access the internet, but you want to prevent resources 
on the internet from initiating communication with your instance, you can use an egress-only 
internet gateway. To do this, create an egress-only internet gateway in your VPC, and then add 
a route to your route table that points all IPv6 traffic (::/0) or a specific range of IPv6 address 
to the egress-only internet gateway. IPv6 traffic in the subnet that's associated with the route table 
is routed to the egress-only internet gateway.
*/

