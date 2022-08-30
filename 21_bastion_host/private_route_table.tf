resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.test-vpc.id

  tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table_association" "private_route_table" {
  count          = length(data.aws_availability_zones.available.names)
  subnet_id      = aws_subnet.private-subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}
