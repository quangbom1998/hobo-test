resource "aws_eip" "this" {
  vpc                            = var.vpc
  instance                       = var.instance
  associate_with_private_ip      = var.associate_with_private_ip
  
  tags = merge(
    {
      "Name" = format("%s", var.name)
    },
    var.tags 
  )

  depends_on                     = [var.eip_depends_on]
}