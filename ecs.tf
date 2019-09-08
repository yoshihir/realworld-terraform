resource "aws_ecs_cluster" "realworld-cluster" {
  name = "realworld-cluster"
}

resource "aws_ecs_service" "realworld" {
  name = "realworld"
  cluster = "${aws_ecs_cluster.realworld-cluster.id}"
  task_definition = "realworld:41"
  desired_count = 1
  enable_ecs_managed_tags = true
  health_check_grace_period_seconds = 0
  launch_type = "FARGATE"
  platform_version = "LATEST"
  propagate_tags = "TASK_DEFINITION"
  tags = {}
  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    target_group_arn = "${aws_lb_target_group.realworld-target-group.arn}"
    container_name = "realworld-app"
    container_port = 9000
  }

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.realworld-sg.id
    ]
    subnets = [
      aws_subnet.realworld-subnet-public-1a.id,
      aws_subnet.realworld-subnet-public-1c.id,
    ]
  }

}