resource "openstack_compute_secgroup_v2" "external" {
    name        = "k8s-external"
    description = "Kubernetes external security group"

    rule {
        from_port   = -1
        to_port     = -1
        ip_protocol = "icmp"
        cidr        = "0.0.0.0/0"
    }

    rule {
        from_port   = 22
        to_port     = 22
        ip_protocol = "tcp"
        cidr        = "0.0.0.0/0"
    }

    rule {
        from_port   = 6443
        to_port     = 6443
        ip_protocol = "tcp"
        cidr        = "0.0.0.0/0"
    }
}


resource "openstack_compute_secgroup_v2" "internal" {
    name        = "k8s-internal"
    description = "Kubernetes internal security group"

    rule {
        from_port   = -1
        to_port     = -1
        ip_protocol = "icmp"
        cidr        = "${var.k8s_node_network}"
    }

    rule {
        from_port   = 1
        to_port     = 65535
        ip_protocol = "tcp"
        cidr        = "${var.k8s_node_network}"
    }

    rule {
        from_port   = 1
        to_port     = 65535
        ip_protocol = "udp"
        cidr        = "${var.k8s_node_network}"
    }

    rule {
        from_port   = -1
        to_port     = -1
        ip_protocol = "icmp"
        cidr        = "${var.k8s_pod_network}"
    }

    rule {
        from_port   = 1
        to_port     = 65535
        ip_protocol = "tcp"
        cidr        = "${var.k8s_pod_network}"
    }

    rule {
        from_port   = 1
        to_port     = 65535
        ip_protocol = "udp"
        cidr        = "${var.k8s_pod_network}"
    }
}
