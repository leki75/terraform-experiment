# OpenStack
variable "os_auth_url" {
    type = "string"
}

variable "os_region" {
    type = "string"
}

variable "os_project_domain" {
    type = "string"
}

variable "os_user_domain" {
    type = "string"
}

variable "os_user" {
    type = "string"
}

variable "os_password" {
    type = "string"
}


# Kubernetes
variable "k8s_node_network" {
    type = "string"
}

variable "k8s_pod_network" {
    type = "string"
}
