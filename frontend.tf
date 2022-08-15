resource "helm_release" "frontend_dev" {
  name       = "frontend-dev"
  repository = "./helm"
  chart      = "frontend"
  namespace        = "frontend-dev"
  create_namespace = true

  values = [
    "${file("./helm/backend/dev-values.yaml")}"
  ]
}

resource "helm_release" "frontend_qa" {
  name       = "frontend-dev"
  repository = "./helm"
  chart      = "frontend"
  namespace        = "frontend-qa"
  create_namespace = true

  values = [
    "${file("./helm/backend/qa-values.yaml")}"
  ]
}

resource "helm_release" "frontend_prod" {
  name       = "frontend-dev"
  repository = "./helm"
  chart      = "frontend"
  namespace        = "frontend-prod"
  create_namespace = true

  values = [
    "${file("./helm/backend/prod-values.yaml")}"
  ]
}