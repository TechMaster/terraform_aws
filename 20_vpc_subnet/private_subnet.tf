resource "aws_subnet" "private-subnet" {
  count                   = length(data.aws_availability_zones.available.names)
  vpc_id                  = aws_vpc.test-vpc.id
  cidr_block              = "10.20.${20 + count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false  # Privat subnet
  tags = {
    Name = "private-subnet${count.index}"
  }
}