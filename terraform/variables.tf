variable "aws_region" {
  type        = string
  description = "AWS region for all resources"
  default     = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
  default     = "bedrock-cluster"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version for EKS cluster"
  default     = "1.29"
}
