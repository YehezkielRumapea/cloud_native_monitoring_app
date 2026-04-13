data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}


locals {
  my_cluster_role = "arn:aws:iam::733202871402:role/eksClusterRole"
  my_node_role = "arn:aws:iam::733202871402:role/RabbitCluster"
}

resource "aws_eks_cluster" "monitoring-app" {
  name = "monitoring-app"
  role_arn = local.my_cluster_role

  vpc_config {
    subnet_ids = data.aws_subnets.default.ids
  }
}

resource "aws_eks_node_group" "monitoring-app" {
  cluster_name = aws_eks_cluster.monitoring-app.name
  node_group_name = "monitoring-app-node-group"
  node_role_arn = local.my_node_role
  subnet_ids = data.aws_subnets.default.ids

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

}