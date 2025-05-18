
resource "helm_release" "ingress-nginx" {
  name             = "${var.project}-ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  version          = "4.12.2"
  namespace        = "ingress"
  create_namespace = true

  values = [
    yamlencode({
      controller = {
        service = {
          annotations = {
            "service.beta.kubernetes.io/aws-load-balancer-type"         = "external"
            "service.beta.kubernetes.io/aws-load-balancer-nlb-target-type" = "ip"
            "service.beta.kubernetes.io/aws-load-balancer-scheme"       = "internet-facing"
          }
          enableHttps = "false"
        }
      }
    })
  ] 
}

