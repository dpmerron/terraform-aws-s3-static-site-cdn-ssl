resource "aws_acm_certificate" "ssl" {
  domain_name       = "*${var.domain}"
  validation_method = "DNS"
  create = 120

  tags {
    site = "${var.domain}"
  }
}

resource "aws_acm_certificate_validation" "ssl" {
  certificate_arn = "${aws_acm_certificate.ssl.arn}"
}