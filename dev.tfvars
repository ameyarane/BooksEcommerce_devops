co_name           = "books-ecommerce"
env               = "dev"
eks_name          = "eks"
node_group_name   = "backend-group"

# Fill in with your EKS cluster IAM master role ARN
master_role_arn   = "arn:aws:iam::949527796968:role/fqts-dev-eks-master-role"

# Fill in with your EKS node IAM worker role ARN
worker_role_arn   = "arn:aws:iam::949527796968:role/fqts-dev-eks-worker-role"

# Fill in with your subnet IDs (usually private subnets for nodes)
subnet_ids        = ["subnet-0445ad7f30dc49eb0", "subnet-0ee3e27d41ca239d6"]

# Capacity: "ON_DEMAND" or "SPOT"
capacity_type     = "ON_DEMAND"

disk_size         = 20

# List of instance types for node group (e.g. ["t3.medium"])
instance_type     = ["t3.medium"]

# Your existing EC2 SSH key name (must exist in AWS)
ec2_ssh_key       = "fqts-demo-key"

# List of security group IDs for remote access/SSH to nodes (if needed)
sg_ids            = ["sg-0e7a5677cf539a795"]

# Scaling configuration
desired_size      = 2
max_size          = 3
min_size          = 1

tags = {
  Application = "BooksEcommerce"
  Environment = "dev"
  Owner       = "shocki"
}

iam_instance_profile   = "eks-admin-role"