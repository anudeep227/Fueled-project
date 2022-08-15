# NETWORKING #
module "vpc" {
  source = "./modules/vpc"

  name = "${local.project}-${local.env_name}-vpc"
  cidr = var.cidr

  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway   = true
  enable_vpn_gateway   = false
  single_nat_gateway   = true
  enable_dns_support   = true
  enable_dns_hostnames = true

  ## Tags for eks node auto scaler...
  private_subnet_tags = {
    "kubernetes.io/cluster/${local.project}-${local.env_name}" = "owned"
    "karpenter.sh/discovery"                                   = "${local.project}-${local.env_name}"
  }

  tags = merge(
    local.common_tags,
    {
      "kubernetes.io/cluster/${local.project}-${local.env_name}" = "shared"
    },
  )
}

