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

resource "aws_route_table_association" "public_route_table" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}
