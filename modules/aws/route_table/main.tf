resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags,
    var.route_table_tags,
  )
}