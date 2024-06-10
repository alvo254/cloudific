output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.cloudific.arn
  description = "The ARN of the ECS task definition"
}

