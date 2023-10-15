
resource "hcloud_network" "k8s_network" {
  name     = "${var.application_name}-network"
  ip_range = var.network_cidr
}

resource "hcloud_network_subnet" "k8s_network_subnet" {
  type         = "cloud"
  network_id   = hcloud_network.k8s_network.id
  network_zone = var.hcloud_network_zone
  ip_range     = var.network_ip_range
}