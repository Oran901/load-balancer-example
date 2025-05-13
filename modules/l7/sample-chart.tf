
resource "helm_release" "sample-chart" {
  name             = "${var.project}-sample-chart"
  chart            = "../sample-chart"
  namespace        = "sample"
  create_namespace = true

  set {
      name = "ingress.domain"
      value = var.domain_name
    }
  
  set {
    name = "type"
    value = var.type
  }
}