resource "helm_release" "backend_dev" {
  name       = "backend-dev"
  repository = "./helm"
  chart      = "backend"
  namespace        = "backend-dev"
  create_namespace = true

  values = [
    "${file("./helm/backend/dev-values.yaml")}"
  ]
}

resource "helm_release" "backend_qa" {
  name       = "backend-qa"
  repository = "./helm"
  chart      = "backend"
  namespace        = "backend-qa"
  create_namespace = true

  values = [
    "${file("./helm/backend/qa-values.yaml")}"
  ]
}

resource "helm_release" "backend_prod" {
  name       = "backend-prod"
  repository = "./helm"
  chart      = "backend"
  namespace        = "backend-prod"
  create_namespace = true


  values = [
    "${file("./helm/backend/prod-values.yaml")}"
  ]
}