# ALB
resource "aws_lb" "this" {
  name = var.application_name

  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = data.aws_subnets.public.ids
}

# ALB Security Group
resource "aws_security_group" "alb" {
  name   = "alb"
  vpc_id = var.aws_vpc_id
}

# Open HTTP port 80 to the world
resource "aws_security_group_rule" "http_ingress" {
  security_group_id = aws_security_group.alb.id

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

# Open HTTP port 8080 to allow ALB to communicate with ECS service
resource "aws_security_group_rule" "ecs_egress" {
  security_group_id        = aws_security_group.alb.id
  type                     = "egress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.ecs_service.id
}


# ALB Listener
resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

# ALB Target Group
resource "aws_lb_target_group" "this" {
  name        = var.application_name
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.aws_vpc_id

  health_check {
    path = "/login"
  }
}