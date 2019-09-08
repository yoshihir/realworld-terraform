resource "aws_lb" "realworld-alb" {
  name = "realworld-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.realworld-alb-sg.id]
  subnets = [
    aws_subnet.realworld-subnet-public-1a.id,
    aws_subnet.realworld-subnet-public-1c.id]
}

resource "aws_lb_target_group" "realworld-target-group" {
  name = "realworld-tg"
  port = 9000
  protocol = "HTTP"
  vpc_id = aws_vpc.realworld.id
  target_type = "ip"
  deregistration_delay = 60

  health_check {
    enabled = true
    healthy_threshold = 5
    interval = 30
    matcher = "200"
    path = "/articles"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 10
    unhealthy_threshold = 5
  }


}

resource "aws_lb_listener" "aws-alb-listener" {
  load_balancer_arn = aws_lb.realworld-alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.realworld-target-group.arn
  }
}