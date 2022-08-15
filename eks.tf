###Createing EKS Cluster
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

module "eks" {
  #     source  = "terraform-aws-modules/eks/aws"
  #   version = "16.2.0"
  source          = "./modules/eks"
  cluster_name    = "${local.project}-${local.env_name}"
  cluster_version = "1.22"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id
  enable_irsa     = true
  tags = merge(
    local.common_tags,
    {
      "kubernetes.io/cluster/${local.project}-${local.env_name}" = "shared"
      "karpenter.sh/discovery"                                   = "${local.project}-${local.env_name}"
    },
  )
  worker_groups = [
    {
      name                 = "worker-grp-01"
      instance_type        = var.instance_type
      asg_desired_capacity = var.asg_desired_capacity
      asg_min_size         = var.asg_min_size
      asg_max_size         = var.asg_max_size
      # additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },
  ]
}