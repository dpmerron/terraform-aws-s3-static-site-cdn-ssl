data "template_file" "init" {
  template = "${file("policy.tpl")}"

  vars {
    policy_name = "${var.name}.${var.domain}"
  }
}

data "template_file" "wwwinit" {
  template = "${file("www-policy.tpl")}"

  vars {
    policy_name = "www.${var.name}.${var.domain}"
  }
}
