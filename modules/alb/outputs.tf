output "alb-id" {
  value = aws_lb.my-alb.id
}

output "alb-tg-arn" {
  value = aws_lb_target_group.my-alb-tg.arn
}