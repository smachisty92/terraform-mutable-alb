resource "aws_lb" "frontend" {
  name               = "frontend"
  internal           = false
  load_balancer_type = "application"
  enable_deletion_protection = false
  subnets = ["subnet-023135617420b0936", "subnet-07cabfb07961dbce8"]
}