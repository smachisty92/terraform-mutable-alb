resource "aws_lb" "frontend" {
  name               = "frontend"
  internal           = false
  load_balancer_type = "application"
  enable_deletion_protection = false
  subnets = ["subnet-023135617420b0936", "subnet-07cabfb07961dbce8"]
}

resource "aws_lb" "backend" {
  name               = "backend"
  internal           = false
  load_balancer_type = "application"
  enable_deletion_protection = false
  subnets = ["subnet-023135617420b0936", "subnet-07cabfb07961dbce8"]
}

module "tags" {
  count = length(local.ALL_TAGS)
  source = "git::https://github.com/smachisty92/terraform-tags"
  TAG_NAME = lookup(element(local.ALL_TAGS,count.index), "name")
  TAG_VALUE= lookup(element(local.ALL_TAGS,count.index), "value")
  RESOURCE_ID = [aws_lb.frontend.id]
}
locals {
  ALL_TAGS= [
    {
      name = "env"
      value = var.ENV
    },
    {
      name = "project_name"
      value = "roboshop"
    }
  ]
}
variable "ENV" {}