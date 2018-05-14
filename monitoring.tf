resource "statuscake_test" "monitoring" {
  website_name = "${var.name}${var.domain}"
  website_url  = "${var.name}${var.domain}"
  test_type    = "HTTP"
  check_rate   = 500
  contact_id   = 100705
}