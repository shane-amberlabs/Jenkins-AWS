# Elastric IPs
resource "aws_eip" "nat1" {

  depends_on = [
    aws_internet_gateway.internet_gateway_main
  ]
}

resource "aws_eip" "nat2" {

  depends_on = [
    aws_internet_gateway.internet_gateway_main
  ]
}
