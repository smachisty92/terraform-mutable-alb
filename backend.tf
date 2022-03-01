resource "aws_lb" "backend" {
  name               = "backend"
  internal           = false
  load_balancer_type = "application"
  enable_deletion_protection = false
  subnets = ["subnet-023135617420b0936", subnet-07cabfb07961dbce8]
}