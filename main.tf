provider "aws" {
  region = "eu-west-1"
}

resource "aws_eks_cluster" "eks" {
  name     = "${var.co_name}-${var.env}-${var.eks_name}"
  role_arn = var.master_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

  tags = merge(
    var.tags,
    {
      "Name" = "${var.co_name}-${var.env}-${var.eks_name}"
    }
  )
}

resource "aws_eks_node_group" "backend" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.co_name}-${var.env}-${var.node_group_name}"
  node_role_arn   = var.worker_role_arn
  subnet_ids      = var.subnet_ids
  capacity_type   = var.capacity_type
  disk_size       = var.disk_size
  instance_types  = var.instance_type

  remote_access {
    ec2_ssh_key                  = var.ec2_ssh_key
    source_security_group_ids    = var.sg_ids
  }
  
  labels =  tomap({env = var.env})
  
  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = 1
  }

  tags = merge(
    var.tags,
    {
      "Name" = aws_eks_cluster.eks.name
    }
  )
}

# ECR for Backend and Frontend
resource "aws_ecr_repository" "backend" {
  name = "books-backend"
}
resource "aws_ecr_repository" "frontend" {
  name = "books-frontend"
}

# Jenkins EC2 (Optional, same as before)
resource "aws_instance" "jenkins" {
  ami           = "ami-0ef0fafba270833fc"
  instance_type = "t2.large"
  subnet_id     = var.subnet_ids[0]
  key_name      = var.ec2_ssh_key
  associate_public_ip_address = true
  iam_instance_profile   = var.iam_instance_profile
  tags = {
    Name = "jenkins-server"
  }

  vpc_security_group_ids = var.sg_ids

  # Add this block to set the root disk size
  root_block_device {
    volume_size = 25
    volume_type = "gp3" # or "gp2" if you prefer
    delete_on_termination = true
  }

}
