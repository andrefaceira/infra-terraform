resource "hcloud_server" "rancher_server" {
  name        = "${var.application_name}-rancher-server"
  image       = var.node_os_image
  server_type = var.rancher_instance_type
  location    = var.hcloud_location
  ssh_keys    = [hcloud_ssh_key.quickstart_ssh_key.id]

  network {
    network_id = hcloud_network.private.id
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "cloud-init status --wait > /dev/null",
      "echo 'Completed cloud-init!'",
    ]

    connection {
      type        = "ssh"
      host        = self.ipv4_address
      user        = var.node_username
      private_key = tls_private_key.global_key.private_key_pem
    }
  }

  depends_on = [
    hcloud_network_subnet.private
  ]
}
