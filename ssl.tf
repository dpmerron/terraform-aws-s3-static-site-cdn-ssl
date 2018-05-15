resource "aws_acm_certificate" "tldn_ssl" {
  domain_name       = "*${var.domain}"
  validation_method = "DNS"
  count = "${var.subdomain}"
  tags {
    site = "${var.domain}"
  }
}

resource "aws_acm_certificate" "subdomain_ssl" {
  domain_name       = "*.${var.domain}"
  validation_method = "DNS"
  count = "${var.tldn}"

  tags {
    site = "${var.domain}"
  }
}

resource "aws_acm_certificate_validation" "tldn_ssl" {
  certificate_arn = "${aws_acm_certificate.ssl.arn}"
}

resource "aws_acm_certificate_validation" "subdomain_ssl" {
  certificate_arn = "${aws_acm_certificate.ssl.arn}"
}
