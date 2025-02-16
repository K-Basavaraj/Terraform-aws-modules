resource "aws_vpc_peering_connection" "peering" {
  count       = var.is_peering_required ? 1 : 0
  vpc_id      = var.vpc_id      #requestor
  peer_vpc_id = var.peer_vpc_id #acceptor
  auto_accept = var.auto_accept
  tags        = var.tags
}