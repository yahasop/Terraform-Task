resource "aws_lb" "my-alb" {
  name               = "my-application-load-balancer"
  internal           = false #This means the LB is facing public internet
  load_balancer_type = "application" #Sets the LB type. In this case its an Application Load Balancer (ALB)
  security_groups    = [var.secgroup-id]
  subnets            = [var.subnet1-id, var.subnet2-id, var.subnet3-id] #Sets the LB to route traffic into the selected subnets
  depends_on         = [var.internet-gateway]
  tags = {
    Name = "my-alb"
  }
}

#A listener check for connection request into the LB
resource "aws_lb_listener" "my-lb-listener" {
  load_balancer_arn = aws_lb.my-alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward" #Directs traffic to the LB
    target_group_arn = aws_lb_target_group.my-alb-tg.arn
  }
}

#Creates the LB target group. Those are the instances where the LB will direct traffic to
resource "aws_lb_target_group" "my-alb-tg" {
  name     = "my-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id
}