resource "aws_egress_only_internet_gateway" "egress_interget_gateway" {
  vpc_id = aws_vpc.test-vpc.id

  tags = {
    Name = "egress_interget_gateway"
  }
}