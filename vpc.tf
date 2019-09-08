resource "aws_vpc" "realworld" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "realworld-vpc"
  }
}