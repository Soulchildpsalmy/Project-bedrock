
module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "~> 20.0"

    cluster_name = var.cluster_name
    cluster_version = var.cluster_version

    vpc_id = var.vpc_id
    subnet_ids = var.private_subnet_ids
    control_plane_subnet_ids = var.private_subnet_ids

    enable_irsa = true

    eks_managed_node_groups = {
        default = {
            instance_types = var.node_instance_types
            desired_size = var.desired_size
            min_size = var.min_size
            max_size = var.max_size
            subnet_ids = var.private_subnet_ids
        }
    }

    tags = { Project = "project-bedrock" }
}