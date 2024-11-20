
output "ecs_cloudwatch_log_group_name" {
  description = "Name of the ECS CloudWatch Log group"
  value       = aws_cloudwatch_log_group.this.name
}

output "jenkins_url" {
  description = "URL of the Jenkins server"
  value       = "http://${aws_lb.this.dns_name}"
}