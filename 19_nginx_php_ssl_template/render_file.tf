data "template_file" "phpsite_conf" {
  template = file("phpsite.conf.tmpl")
  vars = {
    DOMAIN = var.DOMAIN
  }
}

data "template_file" "script_sh" {
  template = file("script.sh.tmpl")
  vars = {
    DOMAIN = var.DOMAIN
    EMAIL = var.EMAIL
  }
}

resource "null_resource" "export_rendered_template" {
  provisioner "local-exec" {
    command = "echo '${data.template_file.phpsite_conf.rendered}' > phpsite.conf"
  }
}