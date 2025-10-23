output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value       = module.eks.cluster_endpoint
}

output "iam_user_name" {
  description = "IAM user created for read-only access"
  value       = module.iam.user_name
}

output "iam_access_key_id" {
  description = "Access key ID for read-only user"
  value       = module.iam.access_key_id
  sensitive   = true
}

output "iam_secret_access_key" {
  description = "Secret access key for read-only user"
  value       = module.iam.secret_access_key
  sensitive   = true
}
