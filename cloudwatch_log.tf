resource "aws_cloudwatch_log_group" "realworld-cloudwatch-log-group" {
  name = "/ecs/realworld"
  retention_in_days = 1
}