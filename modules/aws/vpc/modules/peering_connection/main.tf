resource "aws_vpc_peering_connection" "this" {
  peer_vpc_id                                = var.peer_vpc_id
  vpc_id                                     = var.vpc_id
  auto_accept                                = var.auto_accept

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags
  )
}