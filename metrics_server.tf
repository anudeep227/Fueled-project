resource "helm_release" "metric-server" {
    depends_on = [helm_release.cloudwatch]
  name       = "metrics"
  repository = "./helm"
  chart      = "metrics-server"
  namespace  = "kube-system"

}