resource "aws_route_table" "realworld-public-rt" {
  vpc_id = aws_vpc.realworld.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.realworld-internet-gateway.id
  }

  tags = {
    Name = "realworld-public-rt"
  }
}

resource "aws_route_table_association" "public-1a" {
  subnet_id = aws_subnet.realworld-subnet-public-1a.id
  route_table_id = aws_route_table.realworld-public-rt.id
}

resource "aws_route_table_association" "public-1c" {
  subnet_id = aws_subnet.realworld-subnet-public-1c.id
  route_table_id = aws_route_table.realworld-public-rt.id
}
