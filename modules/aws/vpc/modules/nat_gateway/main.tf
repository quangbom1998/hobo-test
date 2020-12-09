resource "aws_nat_gateway" "this" {
  allocation_id = var.allocation_id
  subnet_id     = var.subnet_id

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
  )
  
  depends_on = [var.nat_gateway_depends_on]
}