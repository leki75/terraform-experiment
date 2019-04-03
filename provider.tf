provider "openstack" {
    auth_url            = "${var.os_auth_url}"
    region              = "${var.os_region}"
    project_domain_name = "${var.os_project_domain}"
    user_domain_name    = "${var.os_user_domain}"

    user_name           = "${var.os_user}"
    password            = "${var.os_password}"
}
