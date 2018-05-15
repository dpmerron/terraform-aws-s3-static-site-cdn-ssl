data "template_file" "init" {
  template = "${file("${path.module}/policy.tpl")}"

  vars {
    policy_name = "${var.name}.${var.domain}"
  }
}