resource "aws_lb" "frontend" {
  name               = "frontend"
  internal           = false
  load_balancer_type = "application"
  enable_deletion_protection = false
  subnets = ["subnet-023135617420b0936", "subnet-07cabfb07961dbce8"]
  tags = {
    Name = "frontend-${var.ENV}"
    env = var.ENV
  }
}

resource "aws_lb" "backend" {
  name               = "backend"
  internal           = false
  load_balancer_type = "application"
  enable_deletion_protection = false
  subnets = ["subnet-023135617420b0936", "subnet-07cabfb07961dbce8"]
  tags = {
    Name = "backend-${var.ENV}"
    env = var.ENV
  }
}


variable "ENV" {}