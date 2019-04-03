# Networks
resource "openstack_networking_network_v2" "internal" {
    name           = "k8s-internal"
    admin_state_up = "true"
}


# Subnets
resource "openstack_networking_subnet_v2" "pods" {
    name = "pods"
    cidr = "${var.k8s_pod_network}"
    enable_dhcp = false
    network_id = "${openstack_networking_network_v2.internal.id}"
    no_gateway = true
}

resource "openstack_networking_subnet_v2" "nodes" {
    name = "nodes"
    cidr = "${var.k8s_node_network}"
    enable_dhcp = false
    network_id = "${openstack_networking_network_v2.internal.id}"
    no_gateway = true
}
