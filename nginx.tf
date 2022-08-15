resource "helm_release" "nginx" {
  name             = "ingress-nginx"
  repository       = "./helm"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true

  set {
    name  = "vpcCidR"
    value = module.vpc.vpc_cidr_block
  }

  set {
    name  = "certificateArn"
    value = aws_acm_certificate.cert.arn
  }

}