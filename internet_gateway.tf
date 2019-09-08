resource "aws_internet_gateway" "realworld-internet-gateway" {
  vpc_id = aws_vpc.realworld.id
  tags = {
    Name = "realworld-igw"
  }
}