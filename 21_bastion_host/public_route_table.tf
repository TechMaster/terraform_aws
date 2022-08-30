resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.test-vpc.id

  route {
    cidr_block = "0.0.0.0/0" # Traffic from Public Subnet reaches Internet via Internet Gateway
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
    //egress_only_gateway_id = aws_egress_only_internet_gateway.egress_interget_gateway.id #https://docs.aws.amazon.com/vpc/latest/userguide/egress-only-internet-gateway.html
  }

  tags = {
    Name = "public_route_table"
  }
}
/*
Your VPC has an implicit router, and you use route tables to control where network traffic is directed. 
Each subnet in your VPC must be associated with a route table, which controls the routing for the subnet 
(subnet route table). You can explicitly associate a subnet with a particular route table. 
Otherwise, the subnet is implicitly associated with the main route table. A subnet can only be associated 
with one route table at a time, but you can associate multiple subnets with the same subnet route table.
*/

resource "aws_route_table_association" "public_route_table" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}
