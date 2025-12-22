output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "ecr_backend_url" {
  value = aws_ecr_repository.backend.repository_url
}

output "ecr_frontend_url" {
  value = aws_ecr_repository.frontend.repository_url
}
