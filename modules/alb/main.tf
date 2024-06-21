resource "aws_alb" "cloudific_alb" {
  name               = "cloudific-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_groups]
  subnets            = [var.subnet1, var.subnet2]

  tags = {
    Name = "my-alb"
  }
}

resource "aws_alb_target_group" "cloudific_tg" {
  name     = "cloudififc-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

resource "aws_alb_listener" "cloudific_listener" {
  load_balancer_arn = aws_alb.cloudific_alb.arn
  port              = 3000
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.cloudific_tg.arn
  }
}