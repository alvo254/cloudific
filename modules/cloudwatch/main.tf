resource "aws_cloudwatch_log_group" "cloudific_lg" {
  name              = "cloudific_lg"
  retention_in_days = 30
}

resource "aws_cloudwatch_metric_alarm" "cloudific_health_lg" {
  alarm_name          = "cloudific_health_alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "HealthyTaskCount"
  namespace           = "AWS/ECS"
  period              = "60"
  statistic           = "Average"
  threshold           = "3"  # Adjust based on your desired_count
  alarm_description   = "This metric monitors the number of healthy ECS tasks"
  # alarm_actions       = [aws_sns_topic.ecs_alerts.arn]

  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.svc_name
  }
}