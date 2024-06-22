output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.cloudific.arn
  description = "The ARN of the ECS task definition"
}

output "Cluster_name" {
  value = aws_ecs_cluster.cloudific.name
}

output "svc_name" {
  value = aws_ecs_service.app_service.name
}
