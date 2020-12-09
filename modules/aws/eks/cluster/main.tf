resource "aws_eks_cluster" "this" {
  name     = var.name
  role_arn = var.role_arn

  vpc_config {
    security_group_ids = var.security_group_ids
    subnet_ids         = var.subnet_ids
  }

  depends_on = [var.cluster_depends_on]
}

#role_arn: The Amazon Resource Name (ARN) of the IAM role that provides permissions for the Kubernetes control plane to make calls 
#to AWS API operations on your behalf. Ensure the resource configuration includes explicit dependencies on the IAM Role permissions 
#by adding depends_on if using the aws_iam_role_policy resource or aws_iam_role_policy_attachment resource, otherwise EKS cannot 
#delete EKS managed EC2 infrastructure such as Security Groups on EKS Cluster deletion.

/*
Ensure the resource configuration includes explicit dependencies on the IAM Role permissions by adding depends_on if using the 
aws_iam_role_policy resource or aws_iam_role_policy_attachment resource, otherwise EKS cannot delete EKS managed EC2 infrastructure 
such as Security Groups on EKS Cluster deletion.
*/