resource "aws_security_group" "realworld-alb-sg" {
  name = "alb-sg"
  description = "alb-sg"
  vpc_id = aws_vpc.realworld.id
  revoke_rules_on_delete = false

  tags = {
    Name = "realworld-alb-sg"
  }
}

resource "aws_security_group_rule" "realworld-alb-sg" {
  security_group_id = aws_security_group.realworld-alb-sg.id
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = [
    "0.0.0.0/0"]
}

resource "aws_security_group_rule" "realworld-alb-sg-1" {
  security_group_id = aws_security_group.realworld-alb-sg.id
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = [
    "0.0.0.0/0"]
}

resource "aws_security_group_rule" "realworld-alb-sg-2" {
  security_group_id = aws_security_group.realworld-alb-sg.id
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  ipv6_cidr_blocks = [
    "::/0"]
}

resource "aws_security_group" "realworld-sg" {
  name = "realworld-sg"
  description = "realworld-sg"
  vpc_id = aws_vpc.realworld.id
  revoke_rules_on_delete = false

  tags = {
    Name = "realworld-sg"
  }
}

resource "aws_security_group_rule" "realworld-sg" {
  security_group_id = aws_security_group.realworld-sg.id
  type = "ingress"
  from_port = 9000
  to_port = 9000
  protocol = "tcp"
  ipv6_cidr_blocks = []
  prefix_list_ids = []
  cidr_blocks = [
    "0.0.0.0/0"]
}

resource "aws_security_group_rule" "realworld-sg-1" {
  security_group_id = aws_security_group.realworld-sg.id
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  ipv6_cidr_blocks = []
  prefix_list_ids = []
  cidr_blocks = [
    "0.0.0.0/0"]
}