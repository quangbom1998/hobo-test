resource "aws_eks_node_group" "this" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  ami_type        = var.ami_type
  disk_size       = var.disk_size
  instance_types  = var.instance_types

  remote_access {
    ec2_ssh_key = var.ec2_ssh_key
  }

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  depends_on = [var.node_group_depends_on]
}