resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.test-vpc.id

  tags = {
    Name = "TestGateway"
  }
}