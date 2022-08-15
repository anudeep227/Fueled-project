resource "aws_acm_certificate" "cert" {
  domain_name = "fueled.com"
  subject_alternative_names = [
    "qa-web.fueled.com",
    "dev-web.fueled.com"
  ]
  validation_method = "DNS"

  tags = local.common_tags

  lifecycle {
    create_before_destroy = true
  }
}