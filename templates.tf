data "template_file" "init" {
  template = "${file("${path.module}/policy.tpl")}"

  vars {
    policy_name = "${var.name}.${var.domain}"
  }
}

data "template_file" "index" {
  template = "${file("${path.module}/index.tpl")}"

  vars {
    domain = "${var.name}.${var.domain}"
  }
}