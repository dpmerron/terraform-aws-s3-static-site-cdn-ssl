resource "aws_s3_bucket" "b" {
  bucket = "${var.name}${var.domain}"
  acl    = "public-read"
  policy = "${data.template_file.init.rendered}"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "${aws_s3_bucket.b.bucket_domain_name}"
    origin_id   = "S3-${var.name}${var.domain}"
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  aliases = ["${var.name}${var.domain}", "www.${var.name}${var.domain}"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${var.name}${var.domain}"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags {
    Environment = "${var.name}${var.domain}"
  }

  viewer_certificate {
    acm_certificate_arn = "${aws_acm_certificate.ssl.arn}"
    ssl_support_method  = "sni-only"
  }
}
