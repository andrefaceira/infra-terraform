
variable "application_name" {
  type    = string
  default = "k8s"
}

variable "hcloud_token" {
  type = string
}

variable "hcloud_network_zone" {
  type    = string
  default = "eu-central"
}

variable "hcloud_location" {
  type    = string
  default = "fsn1"
}

variable "network_cidr" {
  type        = string
  description = "Network to create for private communication"
  default     = "10.0.0.0/8"
}

variable "network_ip_range" {
  type        = string
  description = "Subnet to create for private communication. Must be part of the CIDR defined in `network_cidr`."
  default     = "10.0.1.0/24"
}

variable "node_username" {
  type    = string
  default = "root"
}

variable "node_os_image" {
  type    = string
  default = "ubuntu-20.04"
}

variable "rancher_instance_type" {
  type    = string
  default = "cx21"
}
