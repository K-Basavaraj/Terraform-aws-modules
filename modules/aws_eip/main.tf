resource "aws_eip" "static_ip" {
  address                   = var.address
  associate_with_private_ip = var.associate_with_private_ip
  domain                    = var.domain
  instance                  = var.instance
  ipam_pool_id              = var.ipam_pool_id
  network_border_group      = var.network_border_group
  network_interface         = var.network_interface
  public_ipv4_pool          = var.public_ipv4_pool
  tags                      = var.tags
}
