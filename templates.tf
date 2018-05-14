data "template_file" "init" {
  template = "${file("modules/s3-site/files/policy.tpl")}"

  vars {
    policy_name = "${var.name}${var.domain}"
  }
}

data "template_file" "wwwinit" {
  template = "${file("modules/s3-site/files/www-policy.tpl")}"

  vars {
    policy_name = "www.${var.name}${var.domain}"
  }
}