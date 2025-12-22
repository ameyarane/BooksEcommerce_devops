variable "co_name" {
  default = "books-ecommerce"
}

variable "env" {
  default = "dev"
}

variable "eks_name" {
  default = "eks"
}

variable "node_group_name" {
  default = "backend-group"
}

variable "master_role_arn" {
  description = "EKS cluster master IAM role arn"
}

variable "worker_role_arn" {
  description = "EKS worker node IAM role arn"
}

variable "subnet_ids" {
  type = list(string)
}

variable "capacity_type" {
  default = "ON_DEMAND"
}

variable "disk_size" {
  default = 20
}

variable "instance_type" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "ec2_ssh_key" {
  default = "fqts-demo-key"
}

variable "sg_ids" {
  type = list(string)
}

variable "desired_size" {
  default = 2
}

variable "max_size" {
  default = 3
}

variable "min_size" {
  default = 1
}

variable "tags" {
  type    = map(string)
  default = {}
}
