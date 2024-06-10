resource "aws_ecs_cluster" "cloudific" {
  name = "cloudific"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}



resource "aws_iam_role" "ecs_exec_role" {
  name = "ecsExecRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect = "Allow"
        Sid = ""
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_policy" {
  role       = aws_iam_role.ecs_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "ecs_cloudwatch_logs_policy" {
  role       = aws_iam_role.ecs_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
}

resource "aws_ecs_task_definition" "cloudific" {
  family                = "app"
  network_mode          = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn    = aws_iam_role.ecs_exec_role.arn
  cpu                      = "256"  // CPU value defined at task level
  memory                   = "512"  // Memory value defined at task level
  container_definitions = jsonencode([
    {
      name      = "app"
      image     = "alvin254/fitnesshero:v1.0.0"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
          protocol      = "tcp"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "app_service" {
  name            = "app-service"
  cluster         = aws_ecs_cluster.cloudific.id
  task_definition = aws_ecs_task_definition.cloudific.arn
  desired_count   = 3
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = [var.pub_sub1]
    security_groups = [var.security_group]
    assign_public_ip = true
  }
}