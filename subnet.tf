resource "aws_subnet" "realworld-subnet-public-1a" {
  vpc_id = aws_vpc.realworld.id
  cidr_block = "10.0.11.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "realworld-public-subnet-1a"
  }
}

resource "aws_subnet" "realworld-subnet-public-1c" {
  vpc_id = aws_vpc.realworld.id
  cidr_block = "10.0.12.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "realworld-public-subnet-1c"
  }
}
