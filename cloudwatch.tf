data "aws_iam_policy" "cloudwatch_agent" {
  arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "cloudwatch-attach-policy" {
  role       = module.eks.worker_iam_role_name
  policy_arn = data.aws_iam_policy.cloudwatch_agent.arn
}

resource "helm_release" "cloudwatch" {
  name             = "cloudwatch"
  repository       = "./helm"
  chart            = "cloudwatch"
  namespace        = "amazon-cloudwatch"
  create_namespace = true

  set {
    name  = "ClusterName"
    value = "${local.project}-${local.env_name}"
  }

  set {
    name  = "Region"
    value = var.region
  }

}