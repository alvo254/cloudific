resource "aws_sns_topic" "cloudific_alerts" {
  name = "cloudific_ecs_alerts"
}

resource "aws_sns_topic_subscription" "ecs_subscription" {
  topic_arn = aws_sns_topic.cloudific_alerts.arn
  protocol  = "email"
  endpoint  = "khamron.test@gmail.com"  
}