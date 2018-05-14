resource "aws_acm_certificate" "ssl" {
  domain_name = "*${var.domain}"
  validation_method = "DNS"
  tags {
    site = "${var.domain}"
  }
}
